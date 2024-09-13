
const carritoSideBar = document.querySelector(".off-canvas")
const carritoClose = document.querySelector('.off-canvas .icon-close')
const shoppingCartIcon = document.querySelector('.fa-shopping-cart')
const offCanvasBody = document.querySelector('.off-canvas-body')

function mostrarCarritoSidebar() {
    carritoSideBar.style.visibility = 'visible'
};
function ocultarCarritoSidebar() {
    carritoSideBar.style.visibility = 'hidden'
};

carritoClose.addEventListener('click', ocultarCarritoSidebar)
shoppingCartIcon.addEventListener('click', mostrarCarritoSidebar)

function cargarCarrito() {
    fetch("/carrito/list")
        .then(respuesta => {
            return respuesta.text();
        })
        .then(data => {
            offCanvasBody.innerHTML = data;
            const badge = document.querySelector(".boton-carrito .badge")
            const itemsCarrito = document.querySelector("#items-carrito")
            const n = parseInt(itemsCarrito.innerText)
            if (n > 0) {
                badge.innerText = itemsCarrito.innerText
                badge.style.display = "block"
            }
            else {
                badge.style.display = "none"
            }
            cargarListener()
        })
        .catch(error => {
            console.error('Error al cargar el carrito:', error);
        });
    fetch("/carrito/json")
        .then(respuesta => {
            return respuesta.json();
        })
        .then(resultado => {
            window.carrito = resultado.data
            console.log(resultado.data)

        })
}

cargarCarrito()
function cargarListener() {
    const botonesEliminar = offCanvasBody.querySelectorAll(".eliminar-carrito")
    for (const bt of botonesEliminar) {
        bt.addEventListener("click", function (event) {
            const idCarrito = event.target.getAttribute("data-id")
            fetch("/carrito/" + idCarrito, {
                method: "Delete",
                headers: { 'X-CSRF-TOKEN': window.CSRF_TOKEN }
            })
                .then(x => {

                    cargarCarrito()
                })
                .catch(err => {
                    console.error(err)
                    alert("ha habido un error")

                })
        });
    }


    const btnCantidades = offCanvasBody.querySelectorAll("[data-index-carrito]")
    for (const bt of btnCantidades) {
        bt.addEventListener("change", function (event) {
            const index = event.target.getAttribute("data-index-carrito")
            const item = carrito[index]
            item.cantidad = event.target.value
            recalcularTotal()
            fetch("/carrito/" + item.id, {
                headers: {
                    'X-CSRF-TOKEN': window.CSRF_TOKEN,
                    'content-type': 'application/json'
                },
                method: "post",
                body: JSON.stringify({ color: item.color, talla: item.talla, cantidad: item.cantidad })
            })
            console.log(item)
        })
        bt.addEventListener("keydown", function (event) {
            if (event.keyCode == 13) {
                event.preventDefault()
                event.stopPropagation()
                event.target.blur()
                return false

            }
        })
    }
}
function recalcularTotal() {
    var total = 0
    for (const item of carrito) {
        total += item.cantidad * item.producto.precio

    }
    const el = document.querySelector(".total-carrito span")
    el.innerHTML = total
}
function agregarACarrito(idProducto, cantidad, color, talla) {
    fetch('/carrito', {
        method: 'post',
        headers: {
            'X-CSRF-TOKEN': window.CSRF_TOKEN, "content-type": "application/json"
        },
        body: JSON.stringify({ idProducto: idProducto, color, talla, cantidad })
    })
        .then(Response => Response.json())
        .then(Response => {
            mostrarCarritoSidebar()
            cargarCarrito()
            console.log(Response)
        })
}