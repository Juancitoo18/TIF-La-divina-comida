using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class CarritoPedidoActual : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        NegocioDetalleVenta negDV = new NegocioDetalleVenta();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carritoCompras"] != null)
            {
                gvCarrito.DataSource = (DataTable)Session["carritoCompras"];
                gvCarrito.DataBind();
                lblVacio.Text = "";
                CalcularSumaTotal();
            }
            else
            {
                lblVacio.Text = "No hay productos en el carrito de compras";
            }

            if (this.Request.Cookies["NombreUsuario"] != null)
            {
                LbUsuario.Text = Request.Cookies["NombreUsuario"].Value;
            }
        }

        protected void btnVaciar_Click(object sender, EventArgs e)
        {
            if (gvCarrito.DataSource != null)
            {
                Session["carritoCompras"] = null;
                gvCarrito.DataSource = null;
                gvCarrito.DataBind();
                lblVacio.Text = "Se vació el carrito de compras";
                lblTotal.Text = "";
                lblTextoTotal.Text = "";
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡El carrito ya se encuentra vacío!');</script>");
            }

        }

        protected void CalcularSumaTotal()
        {
            DataTable carrito = (DataTable)Session["carritoCompras"];
            decimal sumaTotal = 0;

            if (carrito != null)
            {
                foreach (DataRow row in carrito.Rows)
                {
                    decimal precioProducto = decimal.Parse(row["PRECIO UNITARIO"].ToString());
                    int cantidad = int.Parse(row["CANTIDAD"].ToString());
                    sumaTotal += precioProducto * cantidad;
                }
            }
            lblTotal.Text = sumaTotal.ToString();
            lblTextoTotal.Text = "TOTAL: $";
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
          if (gvCarrito.DataSource != null)
          {
            Venta venta = new Venta();
            DetalleVenta dv = new DetalleVenta();
            NegocioUsuarios negU = new NegocioUsuarios();
            string nombreUsuario = Request.Cookies["NombreUsuario"].Value;
            int codigoUsuario = negU.ObtenerCodigoUsuario(nombreUsuario);
            venta.CodUsuario1 = codigoUsuario;
            venta.Total1 = Convert.ToInt32(lblTotal.Text);

            
                if (neg.CargarVenta(ref venta) != 0)
                {
                    DataTable tabla = (DataTable)Session["carritoCompras"];
                    foreach (DataRow fila in tabla.Rows)
                    {
                        int codigoProducto = Convert.ToInt32(fila["CODIGO PRODUCTO"]);
                        int cantidad = Convert.ToInt32(fila["CANTIDAD"]);
                        decimal precioUnitario = Convert.ToDecimal(fila["PRECIO UNITARIO"]);
                        DetalleVenta detV = new DetalleVenta();
                        detV.CodigoProducto1 = codigoProducto;
                        detV.Cantidad1 = cantidad;
                        detV.PrecioUnitario1 = precioUnitario;
                        negDV.CargarDetalleVenta(ref detV);
                    }
                    Session["carritoCompras"] = null;
                    lblVacio.Text = "Podrá ver el pedido en su perfil";
                    gvCarrito.DataSource = null;
                    gvCarrito.DataBind();
                    lblTotal.Text = "";
                    lblTextoTotal.Text = "";

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡Pedido realizado exitosamente!');</script>");
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡Se produjo un error en la compra!');</script>");
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡El carrito se encuentra vacío. Porfavor seleccione productos!');</script>");
            }
        }
    }
}