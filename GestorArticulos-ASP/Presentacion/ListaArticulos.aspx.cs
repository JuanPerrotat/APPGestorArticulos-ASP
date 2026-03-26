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
    public partial class ListaArticulos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                List<Articulo> lista = negocio.listar();
                Session["listaArticulos"] = lista;
                Session["listaFiltrada"] = lista;
                dgvArticulos.DataSource = Session["listaFiltrada"];
                dgvArticulos.DataBind();
            }

        }
        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataSource = Session["listaFiltrada"];
            dgvArticulos.DataBind();
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulos.aspx?id=" + id);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];

            if (string.IsNullOrEmpty(txtFiltro.Text))
            {
                Session["listaFiltrada"] = lista;
            }
            else
            {
                List<Articulo> listaFiltrada = lista.FindAll
                    (x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                Session["listaFiltrada"] = listaFiltrada;
            }

            dgvArticulos.PageIndex = 0;
            dgvArticulos.DataSource = Session["listaFiltrada"];
            dgvArticulos.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltro.Enabled = !chkFiltroAvanzado.Checked;
        }

        protected void btnReiniciarFiltro_Click(object sender, EventArgs e)
        {

        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Código")
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
                txtFiltroAvanzado.Enabled = true;
            }
            else if (ddlCampo.SelectedItem.ToString() == "Categoría")
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                List<Categoria> lista = negocio.listarCategoria();
                foreach (Categoria categoria in lista)
                {
                    ddlCriterio.Items.Add(new ListItem(categoria.Descripcion, categoria.Id.ToString()));
                }
                txtFiltroAvanzado.Enabled = false;

            }
            else
            {
                MarcaNegocio negocio = new MarcaNegocio();
                List<Marca> lista = negocio.listarMarca();
                foreach (Marca marca in lista)
                {
                    ddlCriterio.Items.Add(new ListItem(marca.Descripcion, marca.Id.ToString()));
                }

                txtFiltroAvanzado.Enabled = false;
            }


        }

        protected void btnBuscarFiltro_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                dgvArticulos.DataSource = negocio.filtrarAvanzado(ddlCampo.SelectedItem.ToString(),
                                                                ddlCriterio.SelectedItem.ToString(),
                                                                txtFiltroAvanzado.Text);
                dgvArticulos.DataBind();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}