using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        NegocioUsuarios neg = new NegocioUsuarios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIniciarSesion_Click(object sender, EventArgs e)
        {
            string nombreUsuario = TxtUsuario.Text;
            string contrasenia = TxtContraseña.Text;

            string rol = neg.ValidarCredenciales(nombreUsuario, contrasenia);
            string Estado = neg.Estado(nombreUsuario);
            
                if (rol != null)
                {
                    if (Estado == "True")
                    {
                        if (rol == "ADM")
                        {
                            Response.Redirect("AgregarProducto.aspx");
                        }
                        else if (rol == "USU")
                        {
                            Response.Cookies["NombreUsuario"].Value = TxtUsuario.Text;
                            Response.Cookies["NombreUsuario"].Expires = DateTime.Now.AddMinutes(15);
                            Response.Redirect("Menu.aspx");
                        }
                    }
                    else
                    {
                        LblMensaje.Text = "El Usuario fue dado de baja";
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Credenciales inválidas');", true);
                }

                TxtUsuario.Text = "";
                TxtContraseña.Text = "";
        }

    }
}