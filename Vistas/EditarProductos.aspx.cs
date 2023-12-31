using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vistas
{
    public partial class EliminarProducto : System.Web.UI.Page
    {
        NegocioProductos NegProductos = new NegocioProductos();
        Producto productos = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                CargarTabla();
                
            }
        }

        public void CargarTabla()
        {
            NegocioProductos NegProductos = new NegocioProductos();
            GrdListarProductos.DataSource = NegProductos.obtenerTabla();
            GrdListarProductos.DataBind();
        }

        public void CargaXProducto()
        {
            int codigoProg = Convert.ToInt32(TxtBuscarProg.Text);
            GrdListarProductos.DataSource = NegProductos.ObtenerProductoXcod(codigoProg);
            GrdListarProductos.DataBind();
        }

        protected void GridListarProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string CodProducto = ((Label)GrdListarProductos.Rows[e.RowIndex].FindControl("Lbl_Eit_CodProducto")).Text;
            string CodCategoria = ((DropDownList)GrdListarProductos.Rows[e.RowIndex].FindControl("Ddl_Eit_CodCategoria")).Text;
            string codTipoProducto = ((DropDownList)GrdListarProductos.Rows[e.RowIndex].FindControl("Ddl_eit_TipoProducto")).Text;
            string stock = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_eit_StockProducto")).Text;
            string NombreProducto = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_eit_NombreProducto")).Text;
            string descripcion = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_Eit_Descripcion")).Text;
            string precioUnitario = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_eit_PrecioUnitario")).Text;
            string ImagenProducto = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_eit_imagen")).Text;
            string estado = ((TextBox)GrdListarProductos.Rows[e.RowIndex].FindControl("Txt_eit_EstadoProducto")).Text;

            NegocioProductos negProducto = new NegocioProductos();
            Producto productos = new Producto();

            productos.CodigoProductos = Convert.ToInt32(CodProducto);
            productos.CodigoCategorias = Convert.ToInt32(CodCategoria);
            productos.CodigoTipoProductos = Convert.ToInt32(codTipoProducto);
            productos.Stock = Convert.ToInt32(stock);
            productos.NombreProductos = NombreProducto;
            productos.Descripciones = descripcion;
            productos.PrecioUnitarios = Convert.ToDecimal(precioUnitario);
            productos.ImagenesProducto = ImagenProducto;
            productos.Estados = estado;

            int filasAfectadas = negProducto.editarProductos(productos);

            GrdListarProductos.EditIndex = -1;
            if (TxtBuscarProg.Text == "")
            {
                CargarTabla();
            }
            else
            {
                CargaXProducto();
            }
        }

        protected void GridListarProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GrdListarProductos.EditIndex = -1;
            if (TxtBuscarProg.Text == "")
            {
                CargarTabla();
            }
            else
            {
                CargaXProducto();
            }
            CargarTabla();
        }

        protected void GridListarProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrdListarProductos.EditIndex = e.NewEditIndex;

            if(TxtBuscarProg.Text == "")
            {
                CargarTabla();
            }
            else
            {
                CargaXProducto();
            }
            
        }

        /*evento para eliminar un pruducto*/
        protected void GrdListarProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string CodProducto = ((Label)GrdListarProductos.Rows[e.RowIndex].FindControl("Lbl_it_CodProducto")).Text;

            NegocioProductos negProducto = new NegocioProductos();
            Producto Produc = new Producto();

            Produc.CodigoProductos = Convert.ToInt32(CodProducto);

            negProducto.eliminarProducto(Produc);
            CargarTabla();
        }

        protected void GrdListarProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GrdListarProductos.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlCategoria = (DropDownList)e.Row.FindControl("Ddl_eit_CodCategoria");
                DataTable dtCategorias = NegProductos.obtenerDDL();
                ddlCategoria.DataSource = dtCategorias;
                ddlCategoria.DataTextField = "CodCategoria_Ct"; 
                ddlCategoria.DataValueField = "CodCategoria_Ct";
                ddlCategoria.DataBind();

                string currentValueCategoria = DataBinder.Eval(e.Row.DataItem, "CodCategoria_Ct_Pr").ToString();
                ddlCategoria.SelectedValue = currentValueCategoria;
            }

            if (e.Row.RowType == DataControlRowType.DataRow && GrdListarProductos.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlTipo = (DropDownList)e.Row.FindControl("Ddl_eit_TipoProducto");
                DataTable dtTipos = NegProductos.obtenerDDLtipo();
                ddlTipo.DataSource = dtTipos;
                ddlTipo.DataTextField = "CodTipo_T";
                ddlTipo.DataValueField = "CodTipo_T";
                ddlTipo.DataBind();

                string currentValueTipo = DataBinder.Eval(e.Row.DataItem, "CodTipoProducto_T_Pr").ToString();
                ddlTipo.SelectedValue = currentValueTipo;
            }

        }

        protected void BtnBuscarProducto_Click(object sender, EventArgs e)
        {
            if(TxtBuscarProg.Text != "")
            {
                CargaXProducto();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            TxtBuscarProg.Text = "";
            CargarTabla();
        }

        protected void GrdListarProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdListarProductos.PageIndex = e.NewPageIndex;
            if(TxtBuscarProg.Text == "")
            {
                CargarTabla();
            }
            else
            {
                CargaXProducto();
            }
        }
    }
}