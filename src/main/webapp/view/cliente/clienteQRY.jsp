<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="model.BeanCliente" %>
<%@page import="com.sql.Sql" %>
<%@page import="java.util.List" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cliente</title>
    <style type="text/css">
      @import "../../css/estilos.css";
    </style>
    <script type="text/javascript">
      window.onload = function () {
        if (window.history.forward(1)) {
          window.history.go(-1);
        }
      }
    </script>
  </head>
  <body>
    <div id="maincontainer">
      <div id="topsection">
        <div class ="wave" style="height: 100px; overflow: hidden;" >
          <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg>
        </div> 
        <%--<%@ include file="../../WEB-INF/jspf/top2.jspf" %> --%>
      </div>

      <div id="contentwrapper">
        <a href="clienteINS.jsp">Nuevo Cliente</a>
        <br>
        <h3 class="center">Lista de Clientes</h3>
        <%
          List listCliente = Sql.consulta(
                  "SELECT "
                  + " cod_cliente,"
                  + " razon_social,"
                  + " ruc, direccion,"
                  + " zona,"
                  + " giro,"
                  + " tipo_cuenta,"
                  + " estado"
                  + " FROM bdcmsa.cliente"
          );

          if (listCliente != null) {
            out.print("<div class='center'>");
            out.print("<table style='width:100%;margin:auto' border='10'>");

            for (int fil = 0; fil < listCliente.size(); ++fil) {
              Object[] fila = (Object[]) listCliente.get(fil);
              out.print("<tr>");
              if (fil == 0) {
                // Imprimir cabecera
                out.print("<td class='center'><b>Razón Social</b></td>"
                        + "<td class='center'><b>RUC</b></td>"
                        + "<td class='center'><b>Dirección</b></td>"
                        + "<td class='center'><b>Zona</b></td>"
                        + "<td class='center'><b>Giro</b></td>"
                        + "<td class='center'><b>Tipo de cuenta</b></td>"
                        + "<td class='center'><b>Estado</b></td>"
                        + "<td class='center'><b>Editar</b></td>"
                        + "<td class='center'><b>Eliminar</b></td>");
              } else {
                // Imprimir datos
                for (int col = 1; col < fila.length; ++col) {
                  out.print("<td>" + fila[col] + "</td>");
                }
                out.print("<td class='center'>"
                        + " <a href='clienteUPD.jsp?cod_cliente=" + fila[0] + "'>"
                        + "  <img src='../../images/aut.gif' border='0'>"
                        + " </a>"
                        + "</td>");
                out.print("<td class='center'>"
                        + " <a href='clienteDEL.jsp?cod_cliente=" + fila[0] + "'>"
                        + "  <img src='../../images/del.gif' border='0'>"
                        + " </a>"
                        + "</td>");
              }
              out.print("</tr>");
            }
            out.print("</table>");
            out.print("</div>");
          } else {
            session.setAttribute("msg", "No hay acceso a Cliente");
            response.sendRedirect("../../mensaje.jsp");
          }
        %>
        <%-- lista de productos (fin) --%>

        <p style="text-align:center;">
          <a href="../principal/principal.jsp">Principal</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>
  </body>
</html>
