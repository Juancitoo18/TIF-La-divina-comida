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
    public partial class Reporte : System.Web.UI.Page
    {
        NegocioReportes neg = new NegocioReportes();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fechaSeleccionada = cInicio.SelectedDate;
            string fechaFormateada = fechaSeleccionada.ToString("yyyy-MM-dd");
            lblInicio.Text = fechaFormateada;
        }

        protected void cFin_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fechaSeleccionada = cFin.SelectedDate;
            string fechaFormateada = fechaSeleccionada.ToString("yyyy-MM-dd");
            lblFin.Text = fechaFormateada;
        }

        protected void btnVerReporte_Click(object sender, EventArgs e)
        {
            if (lblInicio.Text != "" && lblFin.Text != "")
            {
                lblError.Text = "";
                lblResultado.Text = "INGRESO DE DINERO: $ " + neg.getReporteIngreso(lblInicio.Text, lblFin.Text);
                if (lblResultado.Text == "INGRESO DE DINERO: $ ")
                {
                    lblResultado.Text = "INGRESO DE DINERO: $ 0";
                }
            }
            else
            {
                lblError.Text = "SELECCIONE FECHA DE INICIO Y FIN";
            }
        }
    }
}