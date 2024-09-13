<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class BienvenidoEmail extends Mailable
{
    use Queueable, SerializesModels;
    private $nombre;
    /**
     * Create a new message instance.
     */
    public function __construct($nombre)
    {
        $this->nombre=$nombre;
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



     public function build()
    {
        return $this->markdown('emails.bienvenido')
            ->subject('¡Bienvenido a steamboat ' . '!')
            ->with([
                'nombre' => $this->nombre,
                'correo_atencion_cliente'=>'studiodesignsteamboat@gmail.com',
                'nombre_empresa'=>'nombre_empresa',
                'web'=>'http://mipagina.com'
            ]);
    }
    /*public function content(): Content
    {
        return new Content(
            view: 'emails.bienvenido',with:["nombre"=>$this->nombre]
        );
    }*/

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
