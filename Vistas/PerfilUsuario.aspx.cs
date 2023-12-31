using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using System.IO;

namespace Vistas
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        NegocioUsuarios neg = new NegocioUsuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (this.Request.Cookies["NombreUsuario"] != null)
            {
                string usuario = Request.Cookies["NombreUsuario"].Value;
                LbUsuario.Text = usuario;
                lblUsuario.Text = usuario;
                LblNombreUsuario.Text = neg.Nombre(usuario);
                lblDirecion.Text = neg.Dire(usuario);
                string edad = neg.Edad(usuario);
                lblEdad.Text = edad != "0" ? edad : "";
                lblDNI.Text = neg.DNI(usuario);
                string telefono = neg.Tele(usuario);
                lblTelefono.Text = telefono != "0" ? telefono : "";
                lblMail.Text = neg.Mail(usuario);
                string foto = neg.Foto_Perfil(usuario);
                ImgPerfil.ImageUrl =  foto != "" ? foto : "~/img/Perfill.jpeg";

                int codigo = neg.ObtenerCodigoUsuario(usuario);
                GrdHistorialFactura.DataSource = neg.HistorialFactura(codigo);
                GrdHistorialFactura.DataBind();
                BtnVolver.Visible = false;
            }
        }

        protected void BtnEditarP_Click(object sender, EventArgs e)
        {
            LabelsFalse();
            BtnCancelar.Visible = true;
            BtnConfirmar.Visible = true;
            BtnEditarP.Visible = false;
            FuImagen.Visible = true;
            BtnCargarImagen.Visible = true;
            BtnEliminarImg.Visible = true;
            Lblmensaje.Text = "";
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            TextbotsFalse();
            BtnCancelar.Visible = false;
            BtnConfirmar.Visible = false;
            BtnEditarP.Visible = true;
            BtnEliminarImg.Visible = false;
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            string usuario = TxtUsu.Text.Trim();
            string Contraseña = TxtContraseña.Text.Trim();
            string Dire = TxtDire.Text.Trim();
            string Edad = TxtEdad.Text.Trim();
            string DNI = TxtDNI.Text.Trim();
            string Telefono = TxtTelefono.Text.Trim();
            string Mail = TxtMail.Text.Trim();
            if (usuario != "" && Contraseña != "")
            {
                if (neg.usuarioexistente(usuario))
                {
                    if (!neg.DNIExistente(DNI,usuario))
                    {
                        if (IsValidEmail(Mail))
                        {
                            if (!neg.MailExistente(Mail, usuario))
                            {
                                if (neg.CambiarDatos(usuario, Contraseña, Dire, Edad, DNI, Telefono, Mail) == 1)
                                {
                                    Lblmensaje.Text = "Se Guardaron los cambios";
                                }
                                else
                                {
                                    Lblmensaje.Text = "Error al cambiar los datos";
                                }
                            }
                            else
                            {
                                Lblmensaje.Text = "El Mail Ingresado le pertenece a otra persona";
                            }
                        }
                        else
                        {
                            Lblmensaje.Text = "Ingrese un mail valido";
                        }
                    }
                    else
                    {
                        Lblmensaje.Text = "El DNI Ingresado le pertenece a otra persona";
                    }
                    if (usuario != Request.Cookies["NombreUsuario"].Value)
                    {
                        Lblmensaje.Text = "Ese usuario ya existe porfavor ingrese otro";
                    }
                }
            }
            else
            {
                Lblmensaje.Text = "No puede cambiar usuario o contraseña por campos vacios";
            }
            Cambios();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "limpiarAviso", "limpiarAviso();", true);
        }

        public void LabelsFalse()
        {
            string usuario = Request.Cookies["NombreUsuario"].Value;
            lblUsuario.Visible = false;
            TxtUsu.Visible = true;
            TxtUsu.Text = usuario;
            LblContraseña.Visible = false;
            TxtContraseña.Visible = true;
            TxtContraseña.Text = neg.Contra(usuario);
            lblDirecion.Visible = false;
            TxtDire.Visible = true;
            TxtDire.Text = neg.Dire(usuario);
            lblEdad.Visible = false;
            TxtEdad.Visible = true;
            TxtEdad.Text = neg.Edad(usuario);
            lblDNI.Visible = false;
            TxtDNI.Visible = true;
            TxtDNI.Text = neg.DNI(usuario);
            lblTelefono.Visible = false;
            TxtTelefono.Visible = true;
            TxtTelefono.Text = neg.Tele(usuario);
            lblMail.Visible = false;
            TxtMail.Visible = true;
            TxtMail.Text = neg.Mail(usuario);
        }
        public new void Visible(bool isVisible, string labelText, TextBox textBox, Label label, string value)
        {
            label.Visible = isVisible;
            textBox.Visible = !isVisible;
            label.Text = isVisible ? value : "";
            if (!isVisible)
            {
                textBox.Text =  value;
            }
        }

        public void TextbotsFalse()
        {
            string usuario = Request.Cookies["NombreUsuario"].Value;
            Visible(true, "Usuario", TxtUsu, lblUsuario, usuario);
            Visible(true, "Contraseña", TxtContraseña, LblContraseña, "********");
            Visible(true, "Dirección", TxtDire, lblDirecion, neg.Dire(usuario));
            string edad = neg.Edad(usuario);
            Visible(true, "Edad", TxtEdad, lblEdad, edad != "0" ? edad : "");
            Visible(true, "DNI", TxtDNI, lblDNI, neg.DNI(usuario));
            string telefono = neg.Tele(usuario);
            Visible(true, "Teléfono", TxtTelefono, lblTelefono, telefono != "0" ? telefono : "");
            Visible(true, "Mail", TxtMail, lblMail, neg.Mail(usuario));
            FuImagen.Visible = false;
            BtnCargarImagen.Visible = false;
            BtnEliminarImg.Visible = false;
        }

        public void Cambios()
        {
            string usuario = Request.Cookies["NombreUsuario"].Value;
            Visible(true, "Usuario", TxtUsu, lblUsuario, usuario);
            Visible(true, "Contraseña", TxtContraseña, LblContraseña, "********");
            Visible(true, "Dirección", TxtDire, lblDirecion, neg.Dire(usuario));
            string edad = neg.Edad(usuario);
            Visible(true, "Edad", TxtEdad, lblEdad, edad != "0" ? edad : "");
            Visible(true, "DNI", TxtDNI, lblDNI, neg.DNI(usuario));
            string telefono = neg.Tele(usuario);
            Visible(true, "Teléfono", TxtTelefono, lblTelefono, telefono != "0" ? telefono : "");
            Visible(true, "Mail", TxtMail, lblMail, neg.Mail(usuario));
            BtnCancelar.Visible = false;
            BtnConfirmar.Visible = false;
            BtnEditarP.Visible = true;
            FuImagen.Visible = false;
            BtnCargarImagen.Visible = false;
            BtnEliminarImg.Visible = false;
            LblCambio.Text = "";
        }

        protected void BtnCargarImagen_Click(object sender, EventArgs e)
        {
            string usuario = Request.Cookies["NombreUsuario"].Value;
            string ImagenPerfil;
            if (FuImagen.HasFile)
            {
                string filename = Path.GetFileName(FuImagen.FileName);
                string extension = Path.GetExtension(filename).ToLower();
                if (extension == ".jpg" || extension == ".png")
                {
                    FuImagen.SaveAs(Server.MapPath("~/img/") + filename);
                    ImgPerfil.ImageUrl = "~/img/" + filename;
                    ImagenPerfil = ImgPerfil.ImageUrl;

                    if (neg.CambiarFotoPerfil(usuario, ImagenPerfil) == 1)
                    {
                        ImgPerfil.ImageUrl = "~/img/" + filename;
                        LblCambio.Text = "Se cambió con éxito";
                    }
                    else
                    {
                        LblCambio.Text = "Hubo un problema al cambiar la foto de perfil";
                    }
                }
                else
                {
                    LblCambio.Text = "Formato de archivo no válido. Por favor, selecciona un archivo con extensión .jpg o .png.";
                }
            }
            else
            {
                LblCambio.Text = "Seleccione una imagen";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "limpiarlabel", "limpiarlabel();", true);
        }

        protected void BtnEliminarImg_Click(object sender, EventArgs e)
        {
            string usuario = Request.Cookies["NombreUsuario"].Value;
            neg.CambiarFotoPerfil(usuario, "~/img/Perfill.jpeg");
            string Selecion = ImgPerfil.ImageUrl;
            LblCambio.Text = Selecion == neg.Foto_Perfil(usuario) ? "No hay imagen que pueda ser eliminada" : "Se elemino correctamente";
            ImgPerfil.ImageUrl = "~/img/Perfill.jpeg";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "limpiarlabel", "limpiarlabel();", true);
        }

        protected void GrdHistorialPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MostrarDato")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int factura = Convert.ToInt32( ((Label)GrdHistorialFactura.Rows[rowIndex].FindControl("Lbl_it_NrFactura")).Text);
                GrdHistorialFactura.Visible = false;
                GrdDetalleDeVentas.Visible = true;
                GrdDetalleDeVentas.DataSource = neg.HistorialDetalleVentas(factura);
                GrdDetalleDeVentas.DataBind();
                BtnVolver.Visible = true;
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            GrdHistorialFactura.Visible = true;
            GrdDetalleDeVentas.Visible = false;
            BtnVolver.Visible = false;
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