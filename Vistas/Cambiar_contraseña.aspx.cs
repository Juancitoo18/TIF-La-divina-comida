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
    public partial class Cambiar_contraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnCambiar_Click(object sender, EventArgs e)
        {
            NegocioUsuarios neg = new NegocioUsuarios();
            if (neg.usuarioexistente(TxtUsuario.Text))
            {
                string nuevaContraseña = TxtContraseña.Text;
                string nombreUsuario = TxtUsuario.Text;
                neg.CambiarContraseña(nombreUsuario, nuevaContraseña);
                LblMensaje.Text = "Contraseña cambiada exitosamente";
            }
            else
            {
                LblMensaje.Text = "El nombre de usuario que ingreso no existe, porfavor ingrese uno valido.";
            }
            TxtContraseña.Text = "";
            TxtUsuario.Text = "";
        }
    }
}