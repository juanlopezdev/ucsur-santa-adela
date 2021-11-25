package com.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NameNotFoundException;
import javax.sql.DataSource;

/**
 * @author parainformaticos.com
 */
public final class ConectaDb {


    public Connection getConnection() {
     String sdriver = "com.mysql.cj.jdbc.Driver";
     String url = "jdbc:mysql://localhost:3306/bdcmsa";
     String user = "root";
     String pass = "";
        
        Connection cn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, pass);

        } catch (SQLException e) {
            cn = null;
        } catch (Exception e) {
            cn = null;
        }

        return cn;
    }
}
