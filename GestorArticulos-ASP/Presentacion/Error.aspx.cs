using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
            {
                lblError.Text = Session["error"].ToString();
                Session.Remove("error");
            }
            else
                lblError.Text = "Ocurrió un error inesperado";
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}