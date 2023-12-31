using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int CodigoCategoria;
        private string NombreCategoria;
        public Categoria() { }

        public int CodigoCategoria1 { get => CodigoCategoria; set => CodigoCategoria = value; }
        public string NombreCategoria1 { get => NombreCategoria; set => NombreCategoria = value; }
    }
}
