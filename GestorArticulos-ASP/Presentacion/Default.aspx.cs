using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listar();

            if (!IsPostBack)
            {
                if (Session["mensajeExito"] != null)
                {
                    lblMensajeExito.Text = Session["mensajeExito"].ToString();
                    pnlAltaUser.Visible = true;

                    Session.Remove("mensajeExito");
                }
                
                repRepetidor.DataSource = ListaArticulos;
                repRepetidor.DataBind();
                
            }

            
        }
    }
}