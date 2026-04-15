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
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["Id"];

                if (!string.IsNullOrEmpty(id))
                {
                    try
                    {
                        int idArticulo = int.Parse(id);

                        ArticuloNegocio negocio = new ArticuloNegocio();
                        Articulo seleccionado = negocio.listar().Find(x => x.Id == idArticulo);

                        if (seleccionado != null)
                        {
                            lblNombre.Text = seleccionado.Nombre;
                            lblDescripcion.Text = seleccionado.Descripcion;
                            lblPrecio.Text = seleccionado.Precio.ToString("C0");
                            lblCategoria.Text = seleccionado.Categoria.Descripcion;
                            lblMarca.Text = seleccionado.Marca.Descripcion;
                            imgArticulo.ImageUrl = seleccionado.ImagenUrl;
                        }
                        else
                            Response.Redirect("Default.aspx", false);

                    }
                    catch (Exception ex)
                    {

                        Session.Add("error", ex.Message);
                        Response.Redirect("Error.aspx", false);
                    }

                }
                else
                    Response.Redirect("Default.aspx", false);
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