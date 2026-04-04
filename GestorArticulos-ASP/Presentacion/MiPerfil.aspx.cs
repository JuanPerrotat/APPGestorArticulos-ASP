using Negocio;
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
            if (!Seguridad.sesionActiva(Session["usuarioLogueado"]))
                Response.Redirect("Login.aspx", false);
            imgNuevoPerfil.ImageUrl = "Images/Fallback.png";

            if (!IsPostBack)
            {
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

        }
    }
}