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
    public class NegocioDetalleVenta
    {
        public int CargarDetalleVenta(ref DetalleVenta dv)
        {
            DaoDetalleVenta ds = new DaoDetalleVenta();
            return ds.AgregarDetalleVenta(dv);
        }
    }
}
