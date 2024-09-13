
function validarCorreo() {
    var correo = document.getElementById("email").value;
    var expresionRegular = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (!expresionRegular.test(correo)) {
        alert("Por favor, ingrese una dirección de correo electrónico válida.");
        return false;
    }
    return true;
}
function validarNombre() {
    var nombre = document.getElementById("name").value;
    var expresionRegular = /^[a-zA-Z]$/;

    if (!expresionRegular.test(nombre)) {
        alert("Por favor, ingrese un nombre válido.");
        return false;
    }

    return true;
}
function validarApellidos() {
    var apellidos = document.getElementById("last_name").value;
    var expresionRegular = /^[a-zA-Z  ]$/;

    if (!expresionRegular.test(apellidos)) {
        alert("Por favor, ingrese unos apellidos válidos.");
        return false;
    }

    return true;
}
document.getElementById("formulario-datos").addEventListener("submit", function (event) {
    var fechaNacimiento = document.getElementById("fechaNacimiento").value;
    var mensajeError = document.getElementById("mensajeError");
    var fechaIngresada = new Date(fechaNacimiento);
    var fechaHoy = new Date();
    var edad = fechaHoy.getFullYear() - fechaIngresada.getFullYear();

    // Asegúrate de que el usuario tenga al menos 18 años
    if (edad < 18) {
        mensajeError.innerHTML = "Debes ser mayor de 18 años para registrarte.";
        event.preventDefault(); // Evita que el formulario se envíe
    } else {
        mensajeError.innerHTML = ""; // Borra cualquier mensaje de error anterior
    }
});

function validarDireccion() {
    var direccion = document.getElementById("address").value;
    var expresionRegular = /^[a-zA-Z0-9.- ]$/;

    if (!expresionRegular.test(direccion)) {
        alert("Por favor, ingrese una dirección válida.");
        return false;
    }

    return true;
}
function validarCiudad() {
    var ciudad = document.getElementById("city").value;
    var expresionRegular = /^[a-zA-Z ]$/;

    if (!expresionRegular.test(ciudad)) {
        alert("Por favor, ingrese una ciudad válida.");
        return false;
    }

    return true;
}
function validarCodigoPostal() {
    var cp = document.getElementById("pc").value;
    var expresionRegular = /^[a-zA-Z0-9 ]{5,15}$/;

    if (!expresionRegular.test(cp)) {
        alert("Por favor, ingrese un código postal válido.");
        return false;
    }

    return true;
}
function validarPais() {
    var pais = document.getElementById("country").value;
    var expresionRegular = /^[a-zA-Z ]$/;

    if (!expresionRegular.test(pais)) {
        alert("Por favor, ingrese un país válido.");
        return false;
    }

    return true;
}
function validarProvincia() {
    var provincia = document.getElementById("province").value;
    var expresionRegular = /^[a-zA-Z ]$/;

    if (!expresionRegular.test(provincia)) {
        alert("Por favor, ingrese una provincia válida.");
        return false;
    }

    return true;
}