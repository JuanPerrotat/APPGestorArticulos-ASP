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

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            User nuevoUser = new User();
            UserNegocio userNegocio = new UserNegocio();
            EmailService emailService = new EmailService();
            nuevoUser.Email = txtMail.Text;
            nuevoUser.Pass = txtPassword.Text;
            string ruta = Server.MapPath("~/Templates/AltaUsuario.html");
            string template = emailService.CargarTemplate(ruta);
            var datos = new Dictionary<string, string>
            {
                { "{{EMAIL}}", nuevoUser.Email}
            };
        }
    }
}