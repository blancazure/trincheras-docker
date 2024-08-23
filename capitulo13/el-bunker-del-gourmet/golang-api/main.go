package main

import (
    "database/sql"
    "encoding/json"
    "fmt"
    "io/ioutil"
    "log"
    "net/http"
    "os"
    "strings"
    "time"
    _ "github.com/go-sql-driver/mysql"
)

// Receta representa la estructura de una receta
type Receta struct {
    ID               int    `json:"id"`
    Nombre           string `json:"nombre"`
    TiempoPreparacion string `json:"tiempo_preparacion"`
    Dificultad       string `json:"dificultad"`
    Imagen           string `json:"imagen"`
    Descripcion      string `json:"descripcion"`
    Ingredientes     string `json:"ingredientes"`
    Preparacion      string `json:"preparacion"`
}

var db *sql.DB

func conectarBD() {
    var err error

    // Leer credenciales de los secretos
    dbUser, err := ioutil.ReadFile("/run/secrets/mysql_user")
    if err != nil {
        log.Fatal(err)
    }

    dbPassword, err := ioutil.ReadFile("/run/secrets/mysql_password")
    if err != nil {
        log.Fatal(err)
    }

    dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
        strings.TrimSpace(string(dbUser)),
        strings.TrimSpace(string(dbPassword)),
        os.Getenv("DB_HOST"),
        os.Getenv("DB_PORT"),
        os.Getenv("DB_NAME"),
    )

    maxRetries := 5 // Número máximo de reintentos
    for i := 0; i < maxRetries; i++ {
        db, err = sql.Open("mysql", dsn)
        if err == nil {
            err = db.Ping()
        }

        if err == nil {
            log.Println("Conexión exitosa a la base de datos MySQL")
            return
        }

        log.Printf("Intento de conexión fallido (%d/%d): %v", i+1, maxRetries, err)
        time.Sleep(10 * time.Second) // Espera 10 segundos antes de reintentar
    }

    log.Fatalf("No se pudo conectar a la base de datos después de %d intentos: %v", maxRetries, err)
}

// Middleware para habilitar CORS
func habilitarCORS(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Access-Control-Allow-Origin", "*")
        w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        w.Header().Set("Access-Control-Allow-Headers", "Content-Type")
        if r.Method == "OPTIONS" {
            return
        }
        next.ServeHTTP(w, r)
    })
}

// Endpoint para buscar recetas
func buscarRecetas(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    criterio := r.URL.Query().Get("q")
    query := `SELECT id, nombre, tiempo_preparacion, dificultad, imagen, descripcion, ingredientes FROM recetas WHERE nombre LIKE ? OR descripcion LIKE ? OR ingredientes LIKE ?`
    rows, err := db.Query(query, "%"+criterio+"%", "%"+criterio+"%", "%"+criterio+"%")
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }
    defer rows.Close()

    var recetas []Receta
    for rows.Next() {
        var receta Receta
        err := rows.Scan(&receta.ID, &receta.Nombre, &receta.TiempoPreparacion, &receta.Dificultad, &receta.Imagen, &receta.Descripcion, &receta.Ingredientes)
        if err != nil {
            http.Error(w, err.Error(), http.StatusInternalServerError)
            return
        }
        recetas = append(recetas, receta)
    }

    json.NewEncoder(w).Encode(recetas)
}

// Endpoint para obtener una receta por ID
func obtenerReceta(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    id := strings.TrimPrefix(r.URL.Path, "/receta/")
    query := `SELECT id, nombre, tiempo_preparacion, dificultad, imagen, descripcion, ingredientes, preparacion FROM recetas WHERE id = ?`
    var receta Receta
    err := db.QueryRow(query, id).Scan(&receta.ID, &receta.Nombre, &receta.TiempoPreparacion, &receta.Dificultad, &receta.Imagen, &receta.Descripcion, &receta.Ingredientes, &receta.Preparacion)
    if err != nil {
        if err == sql.ErrNoRows {
            http.NotFound(w, r)
        } else {
            http.Error(w, err.Error(), http.StatusInternalServerError)
        }
        return
    }

    json.NewEncoder(w).Encode(receta)
}

func main() {
    conectarBD()
    defer db.Close()

    // Endpoint para verificar si la API está saludable
    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
        w.WriteHeader(http.StatusOK)
    })

    http.Handle("/buscar", habilitarCORS(http.HandlerFunc(buscarRecetas)))
    http.Handle("/receta/", habilitarCORS(http.HandlerFunc(obtenerReceta)))

    fmt.Println("Servidor escuchando en el puerto 8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
