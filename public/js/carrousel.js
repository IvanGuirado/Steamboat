let indice = 0;
const slides = document.querySelectorAll('.slide');

function cambiarImagen(direccion) {
    slides[indice].classList.remove('actived');

    // Calcular el nuevo índice
    indice = (indice + direccion + slides.length) % slides.length;

    slides[indice].classList.add('actived');
}

// Cambiar imagen cada 5 segundos
setInterval(() => {
    cambiarImagen(1);
}, 5000);

// Inicializa mostrando la primera imagen
slides[indice].classList.add('actived');