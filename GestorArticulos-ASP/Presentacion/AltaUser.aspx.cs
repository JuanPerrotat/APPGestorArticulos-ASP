using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

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
                nuevoUser.Id = negocioUser.altaUser(nuevoUser);
                Session.Add("usuario", nuevoUser);

                EmailService emailService = new EmailService();
                string cuerpoMail = "";
                emailService.ArmarCorreo(nuevoUser.Email, "[No responder] Creación exitosa de usuario", cuerpoMail);
                emailService.EnviarMail();

                Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}