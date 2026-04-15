using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            string ruta = Server.MapPath("~/Templates/ConsultaRecibida.html");
            string template = emailService.CargarTemplate(ruta);
            var datos = new Dictionary<string, string>
            {
                { "{{NOMBRE}}", txtNombre.Text }
            };
            string cuerpoMail = emailService.ReemplazarDatos(template, datos);

            emailService.ArmarCorreo(txtMail.Text, "[No responder] Recibimos tú consulta", cuerpoMail);
            try
            {
                emailService.EnviarMail();
                pnlExito.Visible = true;
                pnlFormulario.Visible = false;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }
        private void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();

            Session.Add("error", "Ocurrió un problema inesperado, volvé a intentar. " +
                "En el caso de no solucionarse, comunicate con el equipo de Stocker en la pestaña de 'Contacto'.");
            Server.Transfer("Error.aspx");
        }
    }
}