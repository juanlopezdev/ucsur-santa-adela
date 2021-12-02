<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="model.BeanCotizacion" %>
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
        <a href="cotizacionINS.jsp">Nueva Cotización</a>
        <br>
        <h3 class="center">Lista de Cotizaciones</h3>
        <%-- lista de cotizaciones (inicio) --%>
        <%
          List lstCotizacion = Sql.consulta(
                  "SELECT "
                  + " cotizacion.cod_cotizacion,"
                  + " cliente.razon_social,"
                  + " CONCAT(usuarios.nombres, ' ', usuarios.apellidos) as usuario,"
                  + " cotizacion.fecha_cotizacion,"
                  + " cotizacion.subtotal,"
                  + " cotizacion.igv,"
                  + " cotizacion.total,"
                  + " cotizacion.estado_cotizacion"
                  + " FROM cotizacion "
                  + " INNER JOIN cliente"
                  + " ON cliente.cod_cliente = cotizacion.cod_cliente"
                  + " INNER JOIN usuarios"
                  + " ON usuarios.idUsuario = cotizacion.idUsuario"
          );

          if (lstCotizacion != null) {
            out.print("<div class='center'>");
            out.print("<table style='width:100%;margin:auto' border='10'>");

            for (int fil = 0; fil < lstCotizacion.size(); ++fil) {
              Object[] fila = (Object[]) lstCotizacion.get(fil);
              out.print("<tr>");
              if (fil == 0) {
                // Imprimir cabecera
                out.print("<td class='center'><b>Cliente</b></td>"
                        + "<td class='center'><b>Usuario</b></td>"
                        + "<td class='center'><b>Fecha Cotización</b></td>"
                        + "<td class='center'><b>Subtotal</b></td>"
                        + "<td class='center'><b>Igv</b></td>"
                        + "<td class='center'><b>Total</b></td>"
                        + "<td class='center'><b>Estado Cotizacion</b></td>"
                        + "<td class='center'><b>Editar</b></td>"
                        + "<td class='center'><b>Agregar producto</b></td>"
                        + "<td class='center'><b>Eliminar</b></td>");
              } else {
                // Imprimir datos
                for (int col = 1; col < fila.length; ++col) {
                  out.print("<td>" + fila[col] + "</td>");
                }
                out.print("<td class='center'>"
                        + " <a href='cotizacionUPD.jsp?cod_cotizacion=" + fila[0] + "'>"
                        + "  <img src='../../images/aut.gif' border='0'>"
                        + " </a>"
                        + "</td>");
                out.print("<td class='center'>"
                        + " <a href='cotizacionUPD.jsp?cod_cotizacion=" + fila[0] + "'>"
                        + "  <img src='../../images/ins.gif' border='0'>"
                        + " </a>"
                        + "</td>");
                out.print("<td class='center'>"
                        + " <a href='cotizacionDEL.jsp?cod_cotizacion=" + fila[0] + "'>"
                        + "  <img src='../../images/del.gif' border='0'>"
                        + " </a>"
                        + "</td>");
              }
              out.print("</tr>");
            }
            out.print("</table>");
            out.print("</div>");
          } else {
            session.setAttribute("msg", "No hay acceso a Cotizaciones");
            response.sendRedirect("../../mensaje.jsp");
          }
        %>
        <%-- lista de cotizaciones (fin) --%>

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
