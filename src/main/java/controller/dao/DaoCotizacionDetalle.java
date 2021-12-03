package controller.dao;

import com.sql.Sql;
import model.BeanCotizacionDetalle;

public class DaoCotizacionDetalle {

  public static String insert(BeanCotizacionDetalle bp) {
    String sql
            = "INSERT INTO bdcmsa.cotizacion_detalle ("
            + "cod_cotizacion, "
            + "cod_tarifario,"
            + "cantidad,"
            + "subtotal,"
            + "igv,"
            + "total,"
            + "nroitem"
            + ") VALUES ("
            + "" + bp.getCodCotizacion() + ", "
            + "" + bp.getCodTarifario() + ", "
            + "" + bp.getCantidad() + ", "
            + "" + bp.getSubtotal() + ", "
            + "" + bp.getIgv() + ", "
            + "" + bp.getTotal() + ", "
            + "" + bp.getNroitem() + ")";
    return Sql.ejecuta(sql);
  }

  public static String delete(BeanCotizacionDetalle bp) {
    String sql = "DELETE FROM bdcmsa.cotizacion_detalle WHERE cod_cotizacion  = " + bp.getCodCotizacion() + " AND cod_tarifario = " +bp.getCodTarifario();
    return Sql.ejecuta(sql);
  }

  public static String update(BeanCotizacionDetalle bp) {
    String sql
            = "UPDATE bdcmsa.cotizacion_detalle SET "
            + " nroitem            = " + bp.getNroitem()+ ","
            + " cod_cotizacion     = " + bp.getCodCotizacion() + ","
            + " cod_tarifario      = " + bp.getCodTarifario() + ","
            + " cantidad           = " + bp.getCantidad() + ","
            + " subtotal           = " + bp.getSubtotal() + ","
            + " igv                = " + bp.getIgv() + ","
            + " total              = " + bp.getTotal() + ""
            + " WHERE cod_cotizacion = " + bp.getCodCotizacion()
            + " AND cod_tarifario = " + bp.getCodTarifario();
    System.out.println(sql);
    System.out.println(Sql.ejecuta(sql));
    return Sql.ejecuta(sql);
  }

}
