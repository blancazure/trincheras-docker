const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const puerto = 3000;

// Middleware para servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Ruta principal
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'), {
        headers: {
            'Content-Type': 'text/html; charset=utf-8'
        }
    });
});

// Ruta para buscar recetas
app.get('/buscar', (req, res) => {
    const terminoBusqueda = req.query.q.toLowerCase();
    fs.readFile('recetas.json', 'utf8', (err, data) => {
        if (err) {
            res.status(500).send('Error al leer el archivo de recetas');
            return;
        }

        const recetas = JSON.parse(data);
        const resultados = recetas.filter(receta =>
            receta.nombre.toLowerCase().includes(terminoBusqueda)
        );

        res.json(resultados);
    });
});

// Iniciar servidor
app.listen(puerto, () => {
    console.log(`Servidor iniciado en http://localhost:${puerto}`);
});
