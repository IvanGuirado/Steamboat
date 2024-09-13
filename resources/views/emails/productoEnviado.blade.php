@component('mail::message')
👋 Hola {{$nombre}},

¡Tenemos súper noticias! 🎉 Tu pedido con el número {{$id_pedido}} ya está en camino y a punto de despegar hacia tu
dirección. 

Aquí tienes los detalles de seguimiento para que puedas seguir la aventura:

- Número de seguimiento: [Número de seguimiento del paquete] 📦
- Compañía de envío: [Nombre de la empresa de envío] 🚚
- Enlace de seguimiento: [Enlace de seguimiento del pedido] 🔍

Puedes usar el enlace de seguimiento o el número de seguimiento para ver en tiempo real cómo se acerca tu paquete.

**Más detalles:**

Dirección de envío: {{$direccion_envio}}

Fecha estimada de entrega: [Fecha estimada de entrega] 📅

Ten en cuenta que la fecha estimada de entrega podría cambiar un poco según dónde te encuentres. Si tienes preguntas o
necesitas ayuda, nuestro equipo de súper héroes del servicio al cliente está listo para ayudarte. Escríbenos a
{{$correo_atencion_cliente}}.

¡Gracias por confiar en nosotros para tu compra en línea! Estamos emocionados por la aventura que te espera con tus
nuevos productos. Si alguna vez necesitas más información no dudes en contactarnos.

¡Hasta la próxima!

¡Abrazos virtuales! 🤗

{{$nombre_empresa}}

{{$web}}

@endcomponent