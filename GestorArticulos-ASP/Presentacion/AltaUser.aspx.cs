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
                Session.Add("usuarioLogueado", nuevoUser);

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
                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }

        }
    }
}