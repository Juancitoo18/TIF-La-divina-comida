using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        private int NrFactura;
        private int CodUsuario;
        private string fecha;
        private decimal Total;
        private bool Estado;
        public Venta() { }

        public int NrFactura1 { get => NrFactura; set => NrFactura = value; }
        public int CodUsuario1 { get => CodUsuario; set => CodUsuario = value; }
        public string Fecha { get => fecha; set => fecha = value; }
        public decimal Total1 { get => Total; set => Total = value; }
        public bool Estado1 { get => Estado; set => Estado = value; }
    }
}