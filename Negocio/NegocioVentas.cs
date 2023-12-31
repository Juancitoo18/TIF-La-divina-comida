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
    public class NegocioVentas
    {
        public DataTable getTablaPendientes()
        {
            DaoVentas dao = new DaoVentas();
            return dao.getTablaPen();
        }
        public DataTable getTabla()
        {
            DaoVentas dao = new DaoVentas();
            return dao.getTablaVentas();
        }

        public DataTable getTablaDetalles(int num)
        {
            DaoVentas dao = new DaoVentas();
            return dao.getTablaDetalleVenta(num);
        }

        public int cambiarEstadoPedido(String numF)
        {
            DaoVentas dao = new DaoVentas();
            int filas=dao.cambiarEstadoConfirmar(numF);
            return filas;
        }

        public int CargarVenta(ref Venta ven)
        {
            DaoVentas ds = new DaoVentas();
            return ds.AgregarVenta(ven);
        }
    }
}