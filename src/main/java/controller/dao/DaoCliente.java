package controller.dao;

import com.sql.Sql;
import model.BeanCliente;

public class DaoCliente {

  public static String insert(BeanCliente bp) {
    String sql
            = "INSERT INTO bdcmsa.cliente ("
            + "razon_social, "
            + "ruc,"
            + "direccion,"
            + "zona,"
            + "giro,"
            + "tipo_cuenta,"
            + "estado"
            + ") VALUES ("
            + "'" + bp.getRazon_Social() + "', "
            + "'" + bp.getRuc() + "', "
            + "'" + bp.getDireccion() + "', "
            + "'" + bp.getZona() + "', "
            + "'" + bp.getGiro() + "', "
            + "'" + bp.getTipo_Cuenta() + "', "
            + "'" + bp.getEstado() + "')";
    return Sql.ejecuta(sql);
  }

  public static String delete(BeanCliente bp) {
    String sql = "DELETE FROM bdcmsa.cliente WHERE cod_cliente  = " + bp.getCodigo();
    return Sql.ejecuta(sql);
  }

  public static String update(BeanCliente bp) {
    String sql
            = "UPDATE bdcmsa.cliente SET "
            + "razon_social = '" + bp.getRazon_Social() + "',"
            + "ruc          = '" + bp.getRuc() + "',"
            + "direccion    = '" + bp.getDireccion() + "',"
            + "zona         = '" + bp.getZona() + "',"
            + "giro         = '" + bp.getGiro() + "',"
            + "tipo_cuenta  = '" + bp.getTipo_Cuenta() + "',"
            + "estado       = '" + bp.getEstado() + "'"
            + "WHERE cod_cliente = " + bp.getCodigo();
    return Sql.ejecuta(sql);
  }

}
