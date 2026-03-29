using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaUser.aspx", false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            User user = new User();
            UserNegocio negocio = new UserNegocio();
            try
            {
                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;

                if (negocio.Login(user))
                {
                    Session.Add("usuario", user);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    lblError.Text = "Usuario o contraseña incorrectos";
                    lblError.Visible = true;
                    //Session.Add("error", "Usuario o contraseña incorrectos");
                    //Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception)
            {

                lblError.Text = "Error al iniciar sesión. Verificá los datos";
                lblError.Visible = true;
            }
        }
    }
}