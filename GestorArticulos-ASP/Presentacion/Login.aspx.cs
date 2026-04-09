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

                Page.Validate();
                if (!Page.IsValid)
                    return;

                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;

                if (negocio.Login(user))
                {
                    Session.Add("usuarioLogueado", user);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    lblError.Text = "Usuario o contraseña incorrectos";
                    lblError.Visible = true;
                   
                }
            }
            catch (Exception)
            {
                Session.Add("error", "Hubo un error. Verificalo con el equipo de Stocker. " +
                    "Podés ponerte en contacto utilizando la pestaña 'Contacto'.");
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}