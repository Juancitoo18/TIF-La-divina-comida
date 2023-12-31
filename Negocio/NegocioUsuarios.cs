using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;


namespace Negocio
{
    public class NegocioUsuarios
    {

        public NegocioUsuarios() { }

        public int CargarUsuario(ref Usuario Usu)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.AgregarUsuario(Usu);
        }
        public string ValidarCredenciales(string nombreUsuario, string contrasenia)
        {
            DaoUsuarios datos = new DaoUsuarios();
            return datos.VerificarCredenciales(nombreUsuario, contrasenia);
        }

        public Boolean usuarioexistente(string Usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.usuarioexistente(Usuario);
        }

        public Boolean DNIExistente(string DNI, string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.DNIExistente(DNI, usuario);
        }

        public Boolean MailExistente(string Mail, string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.MailExistente(Mail, usuario);
        }

        public void CambiarContraseña(string nombreUsuario, string nuevaContraseña)
        {
            DaoUsuarios ds = new DaoUsuarios();
            ds.ActualizarContraseña(nombreUsuario, nuevaContraseña);
        }

        public string Contra(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Contraseña(usuario);
        }

        public string Nombre(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.NombreCompleto(usuario);
        }

        public string Dire(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Direccion(usuario);
        }

        public string Edad(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Edad(usuario);
        }

        public string DNI(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.DNI(usuario);
        }

        public string Tele(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Telefono(usuario);
        }

        public string Mail(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Mail(usuario);
        }

        public string Foto_Perfil(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Url(usuario);
        }

        public int CambiarDatos(string nombreUsuario, string nuevaContraseña, string Dire, string Edad, string DNI, string Telefono, string Mail)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.ActualizarDatos(nombreUsuario, nuevaContraseña, Dire, Edad, DNI, Telefono, Mail);

        }

        public int ObtenerCodigoUsuario(string nombreUsuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.ObtenerCodigo(nombreUsuario);
        }

        public int CambiarFotoPerfil(string nombreUsuario, string UrlPerfil)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.ActualizarImagen(nombreUsuario, UrlPerfil);

        }

        public DataTable HistorialFactura(int codigo)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.HistorialFactura(codigo);
        }

        public DataTable HistorialDetalleVentas(int factura)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.HistorialDetalleVentas(factura);
        }
        public DataTable CargarListviewClientes()
        {
            DaoUsuarios dp = new DaoUsuarios();
            return dp.CargarListviewCuentas();
        }

        public int CambiarROL(string nombreUsuario, string Rol)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.ActualizarRol(nombreUsuario, Rol);
        }

        public int CambiarEstado(string nombreUsuario, int Estado)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.ActualizarEstado(nombreUsuario, Estado);

        }
        public string Estado(string usuario)
        {
            DaoUsuarios ds = new DaoUsuarios();
            return ds.Estado(usuario);
        }
    }
}


