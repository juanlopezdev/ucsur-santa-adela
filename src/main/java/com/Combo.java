package com;

import com.sql.Sql;
import java.util.List;

public class Combo {

    // llega nombre de evento change en javascript
    public static String comboHtml2(String sql, String nameCombo, String nameEvento) {
        List list = Sql.consulta(sql);
        String data = "";

        if (list != null) {
            data += "<select name='" + nameCombo + "' onChange='" + nameEvento +
                    "(this.options[this.selectedIndex].value,this.form)'>";
            for (int fil = 1; fil < list.size(); ++fil) {
                Object[] fila = (Object[]) list.get(fil);

                data += "<option value='" + fila[0] + "'>" + fila[1] + "</option>";
            }
            data += "</select>";
        } else {
            data = "No hay acceso a la base de datos";
        }

        return data;
    }
}

