using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace Presentacion
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "Images/avatar.png";
            if (!(Page is AltaUser || Page is Contacto || Page is Default || Page is Detalle || Page is Error || Page is Login || Page is Login))
            {
                if (!Seguridad.sesionActiva(Session["usuarioLogueado"]))
                    Response.Redirect("Login.aspx", false);
                else
                {
                    User usuario = (User)Session["usuarioLogueado"];
                    if (!string.IsNullOrEmpty(usuario.Nombre))
                        lblUsuario.Text = usuario.Nombre;
                    else
                        lblUsuario.Text = "Usuario";
                    //if (!string.IsNullOrEmpty(usuario.UrlImagenPerfil))
                    //    imgAvatar.ImageUrl = "Images/" + usuario.UrlImagenPerfil;
                }
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaUser.aspx", false);
        }

        protected void btnLoguearse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx", false);
        }
    }
}