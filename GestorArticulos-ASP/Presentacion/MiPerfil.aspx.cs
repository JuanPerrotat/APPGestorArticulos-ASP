using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Seguridad.sesionActiva(Session["usuarioLogueado"]))
                {
                    User usuario = (User)Session["usuarioLogueado"];
                    txtEmail.Text = usuario.Email;
                    txtEmail.Enabled = false;
                    txtNombre.Text = usuario.Nombre;
                    if (string.IsNullOrEmpty(usuario.UrlImagenPerfil))
                        imgNuevoPerfil.ImageUrl = "Images/Fallback.png";
                    else
                        imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.UrlImagenPerfil;
                    if (!string.IsNullOrEmpty(usuario.Apellido))
                        txtApellido.Text = usuario.Apellido;

                }
                else
                    Response.Redirect("Login.aspx", false);
   
                if (Session["mensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["mensajeExito"].ToString();
                    pnlAltaUser.Visible = true;
                    Session.Remove("mensajeExito");
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                UserNegocio negocio = new UserNegocio();
                User user = (User)Session["usuarioLogueado"];

                if (txtImagen.HasFile)
                {
                    string ruta = Server.MapPath("~/Images/");
                    string nombrearchivo = "perfil-" + user.Id + ".jpg";


                    txtImagen.PostedFile.SaveAs(ruta + nombrearchivo);
                    user.UrlImagenPerfil = nombrearchivo;
                    
                }


                user.Email = txtEmail.Text;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.actualizar(user);

                Session["usuarioLogueado"] = user;

                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}