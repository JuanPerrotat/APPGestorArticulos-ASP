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
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;
        }
        public void EnviarMail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw new Exception("No se pudo enviar el mail.", ex);
            }
        }
        public string CargarTemplate(string ruta)
        {
            return System.IO.File.ReadAllText(ruta);
        }
        public string ReemplazarDatos(string template, Dictionary<string, string> datos)
        {
            foreach(var item in datos)
            {
                template = template.Replace(item.Key, item.Value);
            }
            return template;
        }
    }
}
