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
    public partial class Pedidos : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                DataTable tablaListarPendientes = neg.getTablaPendientes();
                if (tablaListarPendientes.Rows.Count > 0) { 
                gvPendientes.DataSource = tablaListarPendientes;
                gvPendientes.DataBind();
                }
                else
                {
                    lblPendientes.Text = "No hay pedidos pendientes";
                    gvPendientes.DataSource = null;
                    gvPendientes.DataBind();
                }

                DataTable tablaListarVentas = neg.getTabla();
                gvVentas.DataSource = tablaListarVentas;
                gvVentas.DataBind();
            }
        }



        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(txtNumFac.Text.Trim());
            DataTable tablaListarDetalles = neg.getTablaDetalles(num);
            if (tablaListarDetalles.Rows.Count > 0) { 
            gvDetalles.DataSource = tablaListarDetalles;
            gvDetalles.DataBind();
            lblDetalleF.Text = "Detalle del pedido: " + txtNumFac.Text;
            txtNumFac.Text = "";
            }
            else
            {
                lblDetalleF.Text = "El número de factura "+txtNumFac.Text+" no existe";
                txtNumFac.Text = "";
                gvDetalles.DataSource = null;
                gvDetalles.DataBind();
            }
        }


        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            String numF = txtConfirmar.Text.Trim().ToString();
            if (neg.cambiarEstadoPedido(numF) != 1)
            {
               lblPendientes.Text = "El número de factura: "+numF+" no se puede confirmar ya que no se encuentra pendiente";
                txtConfirmar.Text = "";

            }
            else
            {
                DataTable tablaListarPendientes = neg.getTablaPendientes();
                gvPendientes.DataSource = tablaListarPendientes;
                gvPendientes.DataBind();

                DataTable tablaListarVentas = neg.getTabla();
                gvVentas.DataSource = tablaListarVentas;
                gvVentas.DataBind();

                lblPendientes.Text = "";
                txtConfirmar.Text = "";

                if (tablaListarPendientes.Rows.Count == 0)
                {
                    lblPendientes.Text = "No hay pedidos pendientes";
                }
            }


        }

    }
}