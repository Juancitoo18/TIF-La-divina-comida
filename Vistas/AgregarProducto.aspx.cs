using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class AgregarProducto : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            /*DDL CATEGORIAS*/
            DataTable tablaCategoria = neg.tablaCategorias();
            ddlCategoria.DataSource = tablaCategoria;
            ddlCategoria.DataTextField = "Nombre_Ct";
            ddlCategoria.DataValueField = "CodCategoria_Ct";
            ddlCategoria.DataBind();

            /*DDL TIPOS*/
            DataTable tablaTipo = neg.tablaTipos();
            ddlTipo.DataSource = tablaTipo;
            ddlTipo.DataTextField = "Nombre_T";
            ddlTipo.DataValueField = "CodTipo_T";
            ddlTipo.DataBind();
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();

            producto.CodigoCategorias = Convert.ToInt32(ddlCategoria.SelectedValue); 
            producto.CodigoTipoProductos = Convert.ToInt32(ddlTipo.SelectedValue);
            producto.Stock = Convert.ToInt32(TxtStock.Text);
            producto.NombreProductos = TxtNombre.Text;
            producto.Descripciones = TxtDescripcion.Text;
            producto.PrecioUnitarios = Convert.ToDecimal(TxtPrecioUnitario.Text);
            producto.ImagenesProducto = TxtImagenes.Text;

            if (neg.CargarProducto(ref producto) != 0)
            {
                ddlCategoria.ClearSelection();
                ddlCategoria.Items[0].Selected = true;
                ddlTipo.ClearSelection();
                ddlTipo.Items[0].Selected = true;
                TxtStock.Text = "";
                TxtNombre.Text = "";
                TxtDescripcion.Text = "";
                TxtPrecioUnitario.Text = "";
                TxtImagenes.Text = "";

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡Producto agregado exitosamente!');</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡Se produjo un error en la carga!');</script>");
            }
        }
    }
}