package controller.dao;

import com.sql.Sql;
import model.BeanUsuario;

public class DaoUsuario {

  public static String insert(BeanUsuario bu) {
    String sql
            = "INSERT INTO usuarios ("
            + "nombres,"
            + "apellidos,"
            + "login,"
            + "password,"
            + "autorizacion"
            + ") VALUES ("
            + "'" + bu.getNombres() + "',"
            + "'" + bu.getApellidos() + "',"
            + "'" + bu.getLogin() + "',"
            + "AES_ENCRYPT('" + bu.getPassword() + "', 'llave'),"
            + "'" + bu.getAutorizacion() + "'"
            + ")";
    return Sql.ejecuta(sql);
  }

  public static String delete(BeanUsuario bu) {
    String sql = "DELETE FROM usuarios WHERE idUsuario=" + bu.getIdUsuario();
    return Sql.ejecuta(sql);
  }

  public static String update(BeanUsuario bu) {
    String sql
            = "UPDATE usuarios SET "
            + "nombres      = '" + bu.getNombres() + "',"
            + "apellidos    = '" + bu.getApellidos() + "',"
            + "login        = '" + bu.getLogin() + "',"
            + "password     = AES_ENCRYPT('" + bu.getPassword() + "', 'llave'),"
            + "autorizacion = '" + bu.getAutorizacion() + "'"
            + "WHERE idUsuario = " + bu.getIdUsuario();
    return Sql.ejecuta(sql);
  }

  public static String updateAutorizacion(BeanUsuario bu) {
    String sql
            = "UPDATE usuarios SET "
            + "autorizacion = '" + bu.getAutorizacion() + "'"
            + "WHERE idUsuario = " + bu.getIdUsuario();
    return Sql.ejecuta(sql);
  }

  public static BeanUsuario getUsuario(String login, String password) {
    BeanUsuario bu = null;
       Object[] fila = Sql.getFila("SELECT idUsuario," +
                "nombres," +
                "apellidos," +
                "login," +
                "password," +
                "autorizacion" +
                " FROM bdcmsa.usuarios WHERE " +
                "login LIKE '" + login +
                "' AND password LIKE '" +
                password + "'");

    if (fila != null) {
      bu = new BeanUsuario();
      bu.setIdUsuario(fila[0].toString());
      bu.setNombres(fila[1].toString());
      bu.setApellidos(fila[2].toString());
      bu.setLogin(fila[3].toString());
      bu.setPassword(fila[4].toString());
      bu.setAutorizacion(fila[5].toString());
    }

    return bu;
  }
}
