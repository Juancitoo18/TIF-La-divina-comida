using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private int CodUsuario;
        private string NombreUsuario;
        private string NombreCompleto;
        private string Mail;
        private string Contrasenia;
        private string RepetirContrasenia;
        private string Rol;
        private int Dni;
        private int Telefono;
        private string Direccion;
        private bool Estado;
        public Usuario() { }

        public int _CodUsuario { get => CodUsuario; set => CodUsuario = value; }
        public string _NombreUsuario { get => NombreUsuario; set => NombreUsuario = value; }
        public string _NombreCompleto { get => NombreCompleto; set => NombreCompleto = value; }
        public string _Mail { get => Mail; set => Mail = value; }
        public string _Contrasenia { get => Contrasenia; set => Contrasenia = value; }
        public string _RepetirContrasenia { get => RepetirContrasenia; set => RepetirContrasenia = value; }
        public string _Rol { get => Rol; set => Rol = value; }
        public int _Dni { get => Dni; set => Dni = value; }
        public int _Telefono { get => Telefono; set => Telefono = value; }
        public string _Direccion { get => Direccion; set => Direccion = value; }
        public bool _Estado { get => Estado; set => Estado = value; }
    }
}
