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
    public partial class Cuentas : System.Web.UI.Page
    {
        NegocioUsuarios neg = new NegocioUsuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cargarlist();
            }
        }

        protected void LvClientes_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Button btnAdmin = e.Item.FindControl("BtnAdmin") as Button;
                Button btnQuitar = e.Item.FindControl("BtnQuitar") as Button;
                Button btnEliminar = e.Item.FindControl("BtnEliminar") as Button;
                Button btnDarAlta = e.Item.FindControl("BtnDarAlta") as Button;
                Label lblEstado = (Label)e.Item.FindControl("LblEstado");
                DataRowView rowView = (DataRowView)e.Item.DataItem;

                int estadoUsuario = Convert.ToInt32(rowView["Estado_U"]); 
                string rolUsuario = rowView["Rol_U"].ToString(); 

                if (estadoUsuario == 0)
                {
                    btnDarAlta.Visible = true;
                    lblEstado.Text = "Usuario dado de Baja";
                    
                }
                else if (estadoUsuario == 1) 
                {
                    btnEliminar.Visible = true;
                    lblEstado.Text = "Usuario Activo";
                }

                if (rolUsuario == "ADM")
                {
                    btnQuitar.Visible = true;
                }
                else if (rolUsuario == "USU")
                {
                    btnAdmin.Visible = true;
                }
            }
        }

        
        protected void BtnAdmin_Click(object sender, EventArgs e)
        {
            Button btnAdmin = (Button)sender;
            string nombreUsuario = btnAdmin.CommandArgument;
            neg.CambiarROL(nombreUsuario, "ADM");
            Cargarlist();
        }

        protected void BtnQuitar_Click(object sender, EventArgs e)
        {
            Button btnQuitar = (Button)sender;
            string nombreUsuario = btnQuitar.CommandArgument;
            neg.CambiarROL(nombreUsuario, "USU");
            Cargarlist();
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            string nombreUsuario = btnEliminar.CommandArgument;
            neg.CambiarEstado(nombreUsuario, 0);
            Cargarlist();
        }

        protected void BtnDarAlta_Click(object sender, EventArgs e)
        {
            Button btnAlta = (Button)sender;
            string nombreUsuario = btnAlta.CommandArgument;
            neg.CambiarEstado(nombreUsuario, 1);
            Cargarlist();
        }

        public void Cargarlist()
        {
            DataTable dt = neg.CargarListviewClientes();
            LvClientes.DataSource = dt;
            LvClientes.DataBind();
        }

        protected void LvClientes_PagePropertiesChanged1(object sender, EventArgs e)
        {
            DataPager lvDataPager = (DataPager)LvClientes.FindControl("DataPager1");
            int startRowIndex = lvDataPager.StartRowIndex;
            int maxRows = lvDataPager.PageSize;
            lvDataPager.SetPageProperties(startRowIndex, maxRows, true);
            if (Session["filtro"] == null)
            {
                DataTable dt = neg.CargarListviewClientes();
                LvClientes.DataSource = dt;
                LvClientes.DataBind();
            }
            else
            {
                LvClientes.DataSource = (DataTable)Session["filtro"];
                LvClientes.DataBind();
            }
        }
    }
}