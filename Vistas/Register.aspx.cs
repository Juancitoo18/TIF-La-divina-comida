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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnIniciar_Click(object sender, EventArgs e)
        {
            NegocioUsuarios neg = new NegocioUsuarios();
            Usuario Usu = new Usuario();
            string Usuario = TxtUsuario.Text.Trim();
            string Mail = TxtMail.Text.Trim();
            if (!neg.usuarioexistente(Usuario))
            {
                if (IsValidEmail(Mail))
                {
                    if (!neg.MailExistente(Mail, Usuario))
                    {
                        Usu._NombreUsuario = TxtUsuario.Text;
                        Usu._NombreCompleto = TxtNombre.Text;
                        Usu._Mail = TxtMail.Text;
                        Usu._Contrasenia = TxtContraseña.Text;
                        Usu._RepetirContrasenia = TxtRepetirContraseña.Text;
                        if (neg.CargarUsuario(ref Usu) != 0)
                        {
                            LblMensaje.Text = "";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('¡Se Registró exitosamente! Ya puedes iniciar sesión'); window.location.href = 'IniciarSesion.aspx';", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>alert('¡Se produjo un error en la carga!');</script>");
                        }
                    }
                    else
                    {
                        LblMensaje.Text = "El Mail Ingresado le pertenece a otra persona";
                        TxtMail.Text = "";
                    }
                }
                else
                {
                    LblMensaje.Text = "Ingrese un mail valido";
                    TxtMail.Text = "";
                }
            }
            else
            {
                LblMensaje.Text = "El nombre de usuario que ingreso ya esta en uso, porfavor ingrese otro";
                TxtUsuario.Text = "";
            }           
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}