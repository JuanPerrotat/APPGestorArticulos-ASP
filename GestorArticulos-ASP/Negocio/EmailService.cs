using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;
        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("juan.test.programation@gmail.com", "lpniwxcuteoqkbgj");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }
        public void ArmarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("stocker-noresponder@gmail.com");
            email.To.Add(emailDestino);
            email.Subject = "[No responder] Stocker - Recibimos: tú consulta";
            email.IsBodyHtml = true;
            email.Body = @"<div style='margin:0; padding:0; background-color:#f4f6f9; font-family:Arial, sans-serif;'>

    <table width='100%' cellpadding='0' cellspacing='0' style='padding:30px 0;'>
        <tr>
            <td align='center'>

                <table width='600' cellpadding='0' cellspacing='0' style='background:#ffffff; border-radius:10px; overflow:hidden; box-shadow:0 4px 12px rgba(0,0,0,0.1);'>

                    <!-- Header -->
                    <tr>
                        <td style='background:#0d6efd; padding:20px; text-align:center; color:#ffffff;'>
                            <h2 style='margin:0;'>Stocker</h2>
                            <span style='font-size:14px;'>Sistema de gestión</span>
                        </td>
                    </tr>

                    <!-- Body -->
                    <tr>
                        <td style='padding:30px; color:#333;'>

                            <p style='margin-top:0;'>Hola,</p>

                            <p>
                                hemos recibido correctamente tu mensaje y queremos agradecerte por contactarte con nosotros.
                            </p>

                            <p>
                                Nuestro equipo estará revisando tu consulta y te responderá a la brevedad posible.
                            </p>              

                            <p style='margin-top:25px;'>
                                Saludos cordiales,<br/>
                                <strong>Equipo de Stocker</strong>
                            </p>

                        </td>
                    </tr>

                    <!-- Footer -->
                    <tr>
                        <td style='background:#f1f1f1; padding:15px; text-align:center; font-size:12px; color:#777;'>
                            Este es un mensaje automático, por favor no responder a este correo.
                        </td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>

</div>";
        }
        public void EnviarMail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
