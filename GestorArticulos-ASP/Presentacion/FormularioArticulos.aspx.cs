using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Presentacion
{
    public partial class FormularioArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			txtId.Enabled = false;
			
			try
			{
				if (!IsPostBack)
				{
                    CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
					List<Categoria> listaCategoria = categoriaNegocio.listarCategoria();
					ddlCategoria.DataSource = listaCategoria;
					ddlCategoria.DataValueField = "Id";
					ddlCategoria.DataTextField = "Descripcion";
					ddlCategoria.DataBind();

                    MarcaNegocio marcaNegocio = new MarcaNegocio();
					List<Marca> listaMarca = marcaNegocio.listarMarca();
					ddlMarca.DataSource = listaMarca;
					ddlMarca.DataValueField = "Id";
					ddlMarca.DataTextField = "Descripcion";
					ddlMarca.DataBind();

				}
			}
			catch (Exception ex)
			{
				Session.Add("error", ex);
				Response.Redirect("Error.aspx", false);
			}
        }
		
        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
           imgArticulo.ImageUrl = txtImagenUrl.Text;
        }
    }
}