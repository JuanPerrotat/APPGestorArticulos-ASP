using System;
using System.Collections.Generic;
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
            server.Credentials = new NetworkCredential("", "");
            server.EnableSsl = true;
            server.Port = 2525;
            server.Host = "";
        }
        public void ArmarCorreo(string emailDestino, string asunto, string cuerpo)
        {

        }
        public void EnviarMail()
        {
            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
