using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        private int CodigoProducto;
        private int CodigoCategoria;
        private int CodigoTipoProducto;
        private int stock;
        private string NombreProducto;
        private string Descripcion;
        private decimal PrecioUnitario;
        private string Imagenes;
        private string estados;
        public Producto() { }

        public int CodigoProductos { get => CodigoProducto; set => CodigoProducto = value; }
        public int CodigoCategorias { get => CodigoCategoria; set => CodigoCategoria = value; }
        public int CodigoTipoProductos { get => CodigoTipoProducto; set => CodigoTipoProducto = value; }
        public int Stock { get => stock; set => stock = value; }
        public string NombreProductos { get => NombreProducto; set => NombreProducto = value; }

        public string Descripciones { get => Descripcion; set => Descripcion = value; }
        public decimal PrecioUnitarios { get => PrecioUnitario; set => PrecioUnitario = value; }
        public string ImagenesProducto { get => Imagenes; set => Imagenes = value; }
        public string Estados { get => estados; set => estados = value; }
    }
}
