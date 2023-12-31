using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        private int NrDeFactura;
        private int CodigoProducto;
        private int cantidad;
        private decimal PrecioUnitario;
        public DetalleVenta() { }

        public int NrDeFactura1 { get => NrDeFactura; set => NrDeFactura = value; }
        public int CodigoProducto1 { get => CodigoProducto; set => CodigoProducto = value; }
        public int Cantidad1 { get => cantidad; set => cantidad = value; }
        public decimal PrecioUnitario1 { get => PrecioUnitario; set => PrecioUnitario = value; }
    }
}
