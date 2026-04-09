using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace Presentacion
{
    public partial class FormularioArticulos : System.Web.UI.Page
    {
        public bool confirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuarioLogueado"]))
            {
                Session.Add("error", "Se requiere permisos de administrador para acceder a ésta pantalla.");
                Response.Redirect("Error.aspx", false);
            }
            
            txtId.Enabled = false;
            confirmaEliminacion = false;
            //imgArticulo.ImageUrl = "Images/Fallback.png";

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

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Articulo seleccionado = negocio.listarModificar(id)[0];

                    Session.Add("articuloSeleccionado", seleccionado);

                    txtId.Text = id;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtPrecio.Text = seleccionado.Precio.ToString("C0");
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    if (!string.IsNullOrEmpty(seleccionado.ImagenUrl))
                        txtImagenUrl.Text = seleccionado.ImagenUrl;

                }

                if (!string.IsNullOrEmpty(txtImagenUrl.Text))
                    imgArticulo.ImageUrl = txtImagenUrl.Text;
                else
                    imgArticulo.ImageUrl = "Images/Fallback.png";

                if (string.IsNullOrEmpty(txtId.Text))
                {
                    btnEliminar.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                Articulo nuevoArticulo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                nuevoArticulo.Codigo = txtCodigo.Text;
                nuevoArticulo.Nombre = txtNombre.Text;
                nuevoArticulo.Descripcion = txtDescripcion.Text;
                nuevoArticulo.Categoria = new Categoria();
                nuevoArticulo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                nuevoArticulo.Marca = new Marca();
                nuevoArticulo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevoArticulo.ImagenUrl = txtImagenUrl.Text;
                nuevoArticulo.Precio = decimal.Parse(txtPrecio.Text);

                if (Request.QueryString["id"] != null)
                {
                    nuevoArticulo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevoArticulo);
                    Session["mensaje"] = "El artículo fue modificado correctamente";
                    Session["tipoMensaje"] = "warning";
                }
                else
                {
                    negocio.agregarArticulo(nuevoArticulo);
                    Session["mensaje"] = "El artículo ha sido dado de alta correctamente";
                    Session["tipoMensaje"] = "success";

                }



                
                Response.Redirect("ListaArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmaEliminacion = true;
        }

        protected void btnEliminarConfirmado_Click(object sender, EventArgs e)
        {
            if (chkConfirmaEliminacion.Checked)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                negocio.eliminar(int.Parse(txtId.Text));
                Session["mensaje"] = "El artículo ha sido eliminado correctamente";
                Session["tipoMensaje"] = "danger";
                Response.Redirect("ListaArticulos.aspx", false);

            }
        }
    }
}