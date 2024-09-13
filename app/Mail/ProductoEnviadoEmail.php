<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ProductoEnviadoEmail extends Mailable
{
    use Queueable, SerializesModels;
    private $nombre;
    private $direccion_envio;
    private $id_pedido;

    /**
     * Create a new message instance.
     */
    public function __construct($nombre, $direccion_envio, $id_pedido)
    {
        $this->nombre = $nombre;
        $this->direccion_envio = $direccion_envio;
        $this->id_pedido = $id_pedido;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Te damos la bienvenida a steamboat',
        );
    }

    /**
     * Get the message content definition.
     */
    /* public function content(): Content
    {
        return new Content(
            view: 'emails.bienvenido',with:["nombre"=>$this->nombre]
        );
    }
*/
    public function build()
    {
        return $this->markdown('emails.productoEnviado')
            ->subject('¡Tú producto ha sido enviado ' . $this->id_pedido. '!')
            ->with([
                'nombre' => $this->nombre,
                'direccion_envio' => $this->direccion_envio,
                'id_pedido' => $this->id_pedido,
                'correo_atencion_cliente'=>'studiodesignsteamboat@gmail.com',
                'nombre_empresa'=>'nombre_empresa',
                'web'=>'http://mipagina.com'
            ]);
    }


    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
