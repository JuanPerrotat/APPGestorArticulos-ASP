using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;


namespace Presentacion
{
    public partial class AltaUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                User nuevoUser = new User();
                UserNegocio negocioUser = new UserNegocio();
                nuevoUser.Email = txtMail.Text;
                nuevoUser.Pass = txtPassword.Text;
                nuevoUser.Nombre = txtNombre.Text;
                nuevoUser.Id = negocioUser.altaUser(nuevoUser);

                User userLogueado = new User();
                userLogueado.Email = nuevoUser.Email;
                userLogueado.Pass = nuevoUser.Pass;
                negocioUser.Login(userLogueado);
                Session["usuarioLogueado"] = userLogueado;

                EmailService emailService = new EmailService();
                string ruta = Server.MapPath("~/Templates/AltaUsuario.html");
                string template = emailService.CargarTemplate(ruta);
                var datos = new Dictionary<string, string>
                {
                     { "{{NOMBRE}}", nuevoUser.Nombre }
                };
                string cuerpoMail = emailService.ReemplazarDatos(template, datos);
                emailService.ArmarCorreo(nuevoUser.Email, "[No responder] Creación exitosa de usuario", cuerpoMail);
                emailService.EnviarMail();

                Session["mensajeExito"] = "¡Tu cuenta fue creada con éxito! Te hemos enviado un mail de verificación. Bienvenido a Stocker.";
                Response.Redirect("MiPerfil.aspx", false);
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