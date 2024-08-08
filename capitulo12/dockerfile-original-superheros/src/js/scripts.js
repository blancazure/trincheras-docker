document.addEventListener('DOMContentLoaded', function() {
    const botonLogin = document.getElementById('boton-login');
    const cajaLogin = document.getElementById('caja-login');

    if (botonLogin) {
        botonLogin.addEventListener('click', function() {
            const usuario = document.getElementById('usuario').value;
            const clave = document.getElementById('clave').value;

            if (usuario === 'admin' && clave === '1234') {
                window.location.href = 'album-fotos.html';
            } else {
                cajaLogin.classList.add('vibrar');
                setTimeout(() => cajaLogin.classList.remove('vibrar'), 500);
            }
        });
    }

    if (window.location.pathname.endsWith('album-fotos.html')) {
        const galeria = document.querySelector('.galeria');
        const modal = document.getElementById('modal');
        const imagenModal = document.getElementById('imagen-modal');
        const cerrarModal = document.getElementById('cerrar-modal');

        const rutasImagenes = [
            "img/imagen01.webp",
            "img/imagen02.webp",
            "img/imagen03.webp",
            "img/imagen04.webp",
            "img/imagen05.webp",
            "img/imagen06.webp",
            "img/imagen07.webp",
            "img/imagen08.webp",
            "img/imagen09.webp",
            "img/imagen10.webp"
        ];

        rutasImagenes.forEach(src => {
            const img = document.createElement('img');
            img.src = src;
            img.alt = 'Foto del álbum';
            img.addEventListener('click', function() {
                modal.style.display = 'block';
                imagenModal.src = this.src;
            });
            galeria.appendChild(img);
        });

        cerrarModal.addEventListener('click', function() {
            modal.style.display = 'none';
        });

        window.addEventListener('click', function(evento) {
            if (evento.target === modal) {
                modal.style.display = 'none';
            }
        });
    }
});
