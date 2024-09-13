//Toggle pagina producto
//Constantes Toggle Titles
const toggleAdditionalInformation = document.querySelector('.title-additional-information');
const toggleRewiews = document.querySelector('.title-reviews');
//Constantes Contenido Texto
const contentAdditionalInformation = document.querySelector('.text-additional-information');
const contentRewiews = document.querySelector('.text-reviews');

//Funciones Toggle

toggleAdditionalInformation.addEventListener('click', () => {
    contentAdditionalInformation.classList.toggle('hidden');
});
toggleRewiews.addEventListener('click', () => {
    contentRewiews.classList.toggle('hidden');
});

//CARRITO
const buttonAnadirCarrito = document.querySelector('.btn-add-to-cart');
if (buttonAnadirCarrito) {
    buttonAnadirCarrito.addEventListener('click', (event) => {
        const idProducto = event.target.getAttribute('data-id')
        const cantidad = document.querySelector(".input-quantity").value;
        const color = document.getElementById("colour").value;
        const talla = document.getElementById("size").value;
        agregarACarrito(idProducto, cantidad, color, talla)


    })
}


