package controller.dao;

import com.sql.Sql;
import model.BeanCotizacion;

public class DaoCotizacion {

  public static String insert(BeanCotizacion bp) {
    String sql
            = "INSERT INTO bdcmsa.cotizacion ("
            + "cod_cotizacion, "
            + "cod_cliente,"
            + "idUsuario,"
            + "fecha_cotizacion,"
            + "subtotal,"
            + "igv,"
            + "total,"
            + "estado_cotizacion"
            + ") VALUES ("
            + "" + bp.getCodCotizacion() + ", "
            + "" + bp.getCodCliente() + ", "
            + "" + bp.getIdUsuario() + ", "
            + "" + bp.getFechaCotizacion() + ", "
            + "" + bp.getSubtotal() + ", "
            + "" + bp.getIgv() + ", "
            + "" + bp.getTotal() + ", "
            + "'" + bp.getEstadoCotizacion() + "')";
    return Sql.ejecuta(sql);
  }

  public static String delete(BeanCotizacion bp) {
    String sql = "DELETE FROM bdcmsa.cotizacion WHERE cod_cotizacion  = " + bp.getCodCotizacion();
    return Sql.ejecuta(sql);
  }

  public static String update(BeanCotizacion bp) {
    String sql
            = "UPDATE bdcmsa.cotizacion SET "
            + "cod_cliente        = '" + bp.getCodCliente() + "',"
            + "idUsuario          = '" + bp.getIdUsuario() + "',"
            + "fecha_cotizacion   = '" + bp.getFechaCotizacion() + "',"
            + "subtotal           = '" + bp.getSubtotal() + "',"
            + "igv                = '" + bp.getIgv() + "',"
            + "total              = '" + bp.getTotal() + "',"
            + "estado_cotizacion  = '" + bp.getEstadoCotizacion() + "'"
            + "WHERE cod_cotizacion = " + bp.getCodCotizacion();
    return Sql.ejecuta(sql);
  }

}
