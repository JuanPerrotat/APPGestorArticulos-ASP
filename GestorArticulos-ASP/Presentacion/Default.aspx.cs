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

            try
            {
                ListaArticulos = negocio.listar();

                if (!IsPostBack)
                {
                    repRepetidor.DataSource = ListaArticulos;
                    repRepetidor.DataBind();
                }

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