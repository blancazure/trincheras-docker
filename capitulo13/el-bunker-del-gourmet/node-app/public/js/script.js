const API_URL = 'http://localhost:50301';

document.addEventListener('DOMContentLoaded', () => {
    // Mostrar todas las recetas cuando la página se carga por primera vez
    buscarRecetas('');
});

document.getElementById('botonBuscar').addEventListener('click', () => {
    const terminoBusqueda = document.getElementById('campoBusqueda').value.trim();
    buscarRecetas(terminoBusqueda);
});

document.getElementById('campoBusqueda').addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        const terminoBusqueda = event.target.value.trim();
        buscarRecetas(terminoBusqueda);
    }
});

function buscarRecetas(terminoBusqueda) {     
     fetch(`${API_URL}/buscar?q=${encodeURIComponent(terminoBusqueda)}`)
        .then(response => response.json())
        .then(recetas => {
            const contenedorResultados = document.getElementById('resultados');
            contenedorResultados.innerHTML = '';
            if (recetas.length === 0) {
                contenedorResultados.innerHTML = `
                    <div class="no-resultados">
                        <img src="img/no-results.png" alt="Sin resultados">
                        <h2>¡Vaya! No encontramos ninguna receta</h2>
                        <p>Intenta con otro término de búsqueda o explora nuestras recetas destacadas.</p>
                        <button id="botonExplorar">Explorar Recetas</button>
                    </div>
                `;
                document.getElementById('botonExplorar').addEventListener('click', () => {
                    buscarRecetas('');
                });
            } else {
                recetas.forEach((receta, index) => {
                    const recetaElemento = document.createElement('div');
                    recetaElemento.classList.add('receta');
                    
                    const dificultadClase = receta.dificultad.toLowerCase().replace('á', 'a').replace('í', 'i');

                    recetaElemento.innerHTML = `
                        <img src="${receta.imagen}" alt="${receta.nombre}">
                        <div class="detalle-receta">
                            <h2>${receta.nombre}</h2>
                            <p class="descripcion">${receta.descripcion}</p>
                            <p class="ingredientes"><strong>Ingredientes:</strong> ${receta.ingredientes}</p>
                        </div>
                        <div class="info-receta">
                            <span class="icono-reloj">⏰</span>${receta.tiempo_preparacion}
                            <span>|</span>
                            <span class="icono-dificultad ${dificultadClase}"></span>${receta.dificultad}
                        </div>
                    `;
                    recetaElemento.addEventListener('click', () => {
                        mostrarModal(receta.id);
                    });
                    contenedorResultados.appendChild(recetaElemento);
                });
            }
        })
        .catch(error => {
            console.error('Error al buscar recetas:', error);
        });
}

function mostrarModal(recetaId) {
    fetch(`${API_URL}/receta/${recetaId}`)
        .then(response => response.json())
        .then(receta => {
            const modal = document.getElementById('modalReceta');
            const modalImagen = document.getElementById('modalImagen');
            const modalNombre = document.getElementById('modalNombre');
            const modalDescripcion = document.getElementById('modalDescripcion');
            const modalTiempo = document.getElementById('modalTiempo');
            const modalDificultad = document.getElementById('modalDificultad');
            const modalIngredientes = document.getElementById('modalIngredientes');
            const modalPreparacion = document.getElementById('modalPreparacion');
            
            // Asignar valores a los elementos del modal
            modalImagen.src = receta.imagen;
            modalNombre.textContent = receta.nombre;
            modalDescripcion.textContent = receta.descripcion;
            
            // Asignar tiempo de preparación con icono
            modalTiempo.innerHTML = `<span class="icono-reloj">⏰</span> ${receta.tiempo_preparacion}`;
            
            // Asignar dificultad con icono
            const dificultadClase = receta.dificultad.toLowerCase().replace('á', 'a').replace('í', 'i');
            modalDificultad.innerHTML = `<span class="icono-dificultad ${dificultadClase}"></span> ${receta.dificultad}`;
            
            modalIngredientes.innerHTML = receta.ingredientes.split(',').map(ing => `<li>${ing}</li>`).join('');
            
            // Renderizar la preparación como HTML
            modalPreparacion.innerHTML = receta.preparacion;

            // Mostrar el modal
            modal.style.display = 'block';

            // Funcionalidad de Text-to-Speech
            const speech = new SpeechSynthesisUtterance();
            speech.text = modalPreparacion.textContent; // Usar el texto plano de la preparación para TTS

            document.getElementById('ttsPlay').addEventListener('click', () => {
                speechSynthesis.speak(speech);
            });

            document.getElementById('ttsPause').addEventListener('click', () => {
                speechSynthesis.cancel();
            });

            // Cerrar el modal al hacer clic en el botón de cerrar
            document.getElementById('cerrarModal').addEventListener('click', () => {
                modal.style.animation = 'slideOut 0.5s ease forwards, fadeOut 0.5s ease';
                setTimeout(() => {
                    modal.style.display = 'none';
                    modal.style.animation = ''; // Resetear animación
                }, 500);
            });
        })
        .catch(error => {
            console.error('Error al cargar la receta:', error);
        });
}
