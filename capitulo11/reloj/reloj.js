// Función para agregar un cero a los números menores a 10
function agregarCero(numero) {
    return numero < 10 ? '0' + numero : numero;
}

// Variables para almacenar los valores anteriores
let horasPrevias = '';
let minutosPrevios = '';

// Función para actualizar el reloj
function actualizarReloj() {
    const ahora = new Date();
    const horas = agregarCero(ahora.getHours());
    const minutos = agregarCero(ahora.getMinutes());
    const segundos = agregarCero(ahora.getSeconds());

    const dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
    const nombreDia = dias[ahora.getDay()];
    const nombreMes = meses[ahora.getMonth()];
    const dia = ahora.getDate();
    const anhio = ahora.getFullYear();

    const digitoHoras = document.getElementById('horas');
    const digitoMinutos = document.getElementById('minutos');
    const digitoSegundos = document.getElementById('segundos');

    // Animar y actualizar horas solo si han cambiado
    if (horas !== horasPrevias) {
        digitoHoras.textContent = horas;
        digitoHoras.style.transform = 'scale(1.2)';
        setTimeout(() => {
            digitoHoras.style.transform = 'scale(1)';
        }, 500);
        horasPrevias = horas;  // Actualizar horasPrevias
    }

    // Animar y actualizar minutos solo si han cambiado
    if (minutos !== minutosPrevios) {
        digitoMinutos.textContent = minutos;
        digitoMinutos.style.transform = 'scale(1.2)';
        setTimeout(() => {
            digitoMinutos.style.transform = 'scale(1)';
        }, 500);
        minutosPrevios = minutos;  // Actualizar minutosPrevios
    }

    // Siempre animar y actualizar los segundos
    digitoSegundos.textContent = segundos;
    digitoSegundos.style.transform = 'scale(1.2)';
    setTimeout(() => {
        digitoSegundos.style.transform = 'scale(1)';
    }, 500);

    // Formato de fecha: "Lunes 12 de Agosto de 2024"
    document.getElementById('fecha').textContent = `${nombreDia} ${dia} de ${nombreMes} de ${anhio}`;
}

// Iniciar el reloj y actualizar cada segundo
setInterval(actualizarReloj, 1000);
actualizarReloj();  // Inicializar el reloj inmediatamente
