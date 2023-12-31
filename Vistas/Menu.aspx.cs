using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;

namespace Vistas
{
    public partial class Menu : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = neg.CargarListview();
                LvProductos.DataSource = dt;
                LvProductos.DataBind();

                DataTable TipoProducto = neg.obtenerDDLtipo();
                DdlTipoProducto.DataSource = TipoProducto;
                DdlTipoProducto.DataTextField = "Nombre_T";
                DdlTipoProducto.DataValueField = "CodTipo_T";
                DdlTipoProducto.DataBind();
                DdlTipoProducto.Items.Insert(0, "-TODAS LAS COMIDAS-");
            }

            if (this.Request.Cookies["NombreUsuario"] != null)
            {
                LbUsuario.Text = Request.Cookies["NombreUsuario"].Value;
            }

        }

        protected void BtnAgregarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "EventSeleccion1")
            {
                        String aux = e.CommandArgument.ToString();
                        if (Session["carritoCompras"] == null)
                        {
                            Session["carritoCompras"] = CrearTabla();
                        }

                        DataTable tabla = (DataTable)Session["carritoCompras"];
                        DataRow existe = null;

                        foreach (DataRow row in tabla.Rows)
                        {
                            if (row["CODIGO PRODUCTO"].ToString() == aux)
                            {
                                existe = row;
                                break;
                            }
                        }

                        if (existe != null)
                        {
                            existe["CANTIDAD"] = Convert.ToInt32(existe["CANTIDAD"]) + 1;
                        }
                        else
                        {
                            foreach (ListViewItem I in LvProductos.Items)
                            {
                                if (((Label)I.FindControl("LblId")).Text == aux)
                                {
                                    String codigoProducto = ((Label)I.FindControl("LblId")).Text;
                                    String nombreProducto = ((Label)I.FindControl("NombreProducto_PrLabel")).Text;
                                    String precioProducto = ((Label)I.FindControl("PrecioUnitario_PrLabel")).Text;
                                    AgregarFila((DataTable)Session["carritoCompras"], codigoProducto, 1, nombreProducto, precioProducto);

                                }
                            }
                        }     
                
                LblAviso.Text = "SE AGREGO AL CARRITO";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "limpiarAviso", "limpiarAviso();", true);
        }

        public static DataTable CrearTabla()
        {
            DataTable dt = new DataTable();

            DataColumn Columna = new DataColumn("CODIGO PRODUCTO", System.Type.GetType("System.String"));
            dt.Columns.Add(Columna);

            Columna = new DataColumn("CANTIDAD", System.Type.GetType("System.Int32"));
            dt.Columns.Add(Columna);

            Columna = new DataColumn("NOMBRE PRODUCTO", System.Type.GetType("System.String"));
            dt.Columns.Add(Columna);

            Columna = new DataColumn("PRECIO UNITARIO", System.Type.GetType("System.String"));
            dt.Columns.Add(Columna);

            return dt;
        }

        public static void AgregarFila(DataTable tabla, string codigoPr, int cantidad, string nombrePr, string precioPr)
        {
            DataRow dr = tabla.NewRow();

            dr["CODIGO PRODUCTO"] = codigoPr;
            dr["CANTIDAD"] = cantidad;
            dr["NOMBRE PRODUCTO"] = nombrePr;
            dr["PRECIO UNITARIO"] = precioPr;

            tabla.Rows.Add(dr);
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string buscarProducto = TxtBusqueda.Text.Trim();
            DataTable dt = neg.ResultadoBusqueda(buscarProducto);
            LvProductos.DataSource = dt;
            LvProductos.DataBind();
            TxtBusqueda.Text = "";
            Session["filtro"] = dt;
            ddlOrdenarPrecio.SelectedIndex = -1;
            DdlTipoProducto.SelectedIndex = -1;

        }

        protected void DdlTipoProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipoDato = DdlTipoProducto.SelectedIndex;
            if (ddlOrdenarPrecio.SelectedValue == "Mayor")
            {
                DataTable dt = neg.PrecioMayor_Menor("Mayor", tipoDato);
                LvProductos.DataSource = dt;
                LvProductos.DataBind();
                Session["filtro"] = dt;
            }
            if (ddlOrdenarPrecio.SelectedValue == "Menor")
            {
                DataTable dt = neg.PrecioMayor_Menor("Menor", tipoDato);
                LvProductos.DataSource = dt;
                LvProductos.DataBind();
                Session["filtro"] = dt;
            }
            if (ddlOrdenarPrecio.SelectedValue == "Nada" || DdlTipoProducto.SelectedIndex == 0)
            {
                DataTable dt = neg.ResultadoTipo(tipoDato);
                LvProductos.DataSource = dt;
                LvProductos.DataBind();
                Session["filtro"] = dt;
                ddlOrdenarPrecio.SelectedIndex = -1;
            }
        }

        protected void ddlOrdenarPrecio_SelectedIndexChanged(object sender, EventArgs e)
        {
            string opcion = ddlOrdenarPrecio.SelectedValue;
            DataTable dt = neg.PrecioMayor_Menor(opcion, DdlTipoProducto.SelectedIndex);
            LvProductos.DataSource = dt;
            LvProductos.DataBind();
            Session["filtro"] = dt;
            if (ddlOrdenarPrecio.SelectedValue == "Nada")
            {
                DdlTipoProducto.SelectedIndex = -1;
            }
        }

        protected void LvProductos_PagePropertiesChanged(object sender, EventArgs e)
        {
            DataPager lvDataPager = (DataPager)LvProductos.FindControl("DataPager1");
            int startRowIndex = lvDataPager.StartRowIndex;
            int maxRows = lvDataPager.PageSize;
            lvDataPager.SetPageProperties(startRowIndex, maxRows, true);
            if (Session["filtro"] == null)
            {
                DataTable dt = neg.CargarListview();
                LvProductos.DataSource = dt;
                LvProductos.DataBind();
            }
            else
            {
                LvProductos.DataSource = (DataTable)Session["filtro"];
                LvProductos.DataBind();
            }
        }
    }
}