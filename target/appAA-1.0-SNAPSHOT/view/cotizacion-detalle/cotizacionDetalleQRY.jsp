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
      <%
        String codigo = request.getParameter("cod_cotizacion");
      %>
      <div id="contentwrapper">
        <a href="cotizacionDetalleINS.jsp?cod_cotizacion=<%=codigo%>">Agregar</a>
        <br>
        <h3 class="center">Detalle cotización</h3>
        <%-- lista de cotizaciones (inicio) --%>
        <%
          List lstCotizacionDetalle = Sql.consulta(
                  "SELECT "
                  + " cotizacion_detalle.cod_cotizacion,"
                  + " cotizacion_detalle.cod_tarifario,"
                  + " cotizacion_detalle.nroitem,"
                  + " tarifario.servicio,"
                  + " tarifario.descripcion,"
                  + " tarifario.precio,"
                  + " cotizacion_detalle.cantidad,"
                  + " cotizacion_detalle.subtotal,"
                  + " cotizacion_detalle.igv,"
                  + " cotizacion_detalle.total"
                  + " FROM cotizacion_detalle "
                  + " INNER JOIN tarifario"
                  + " ON tarifario.cod_tarifario = cotizacion_detalle.cod_tarifario"
                  + " WHERE cotizacion_detalle.cod_cotizacion = " + codigo
          );

          if (lstCotizacionDetalle != null) {
            out.print("<div class='center'>");
            out.print("<table style='width:100%;margin:auto' border='10'>");

            for (int fil = 0; fil < lstCotizacionDetalle.size(); ++fil) {
              Object[] fila = (Object[]) lstCotizacionDetalle.get(fil);
              out.print("<tr>");
              if (fil == 0) {
                // Imprimir cabecera
                out.print("<td class='center'><b>#</b></td>"
                        + "<td class='center'><b>Servicio</b></td>"
                        + "<td class='center'><b>Descripción</b></td>"
                        + "<td class='center'><b>Precio Unit.</b></td>"
                        + "<td class='center'><b>Cantidad</b></td>"
                        + "<td class='center'><b>Subtotal</b></td>"
                        + "<td class='center'><b>Igv</b></td>"
                        + "<td class='center'><b>Total</b></td>"
                        + "<td class='center'><b>Editar</b></td>"
                        + "<td class='center'><b>Eliminar</b></td>");
              } else {
                // Imprimir datos
                for (int col = 2; col < fila.length; ++col) {
                  out.print("<td>" + fila[col] + "</td>");
                }
                out.print("<td class='center'>"
                        + " <a href='cotizacionDetalleUPD.jsp?cod_cotizacion=" + fila[0] + "&cod_tarifario=" + fila[1] + "'>"
                        + "  <img src='../../images/aut.gif' border='0'>"
                        + " </a>"
                        + "</td>");
                out.print("<td class='center'>"
                        + " <a href='cotizacionDetalleDEL.jsp?cod_cotizacion=" + fila[0] + "&cod_tarifario=" + fila[1] + "'>"
                        + "  <img src='../../images/del.gif' border='0'>"
                        + " </a>"
                        + "</td>");
              }
              out.print("</tr>");
            }
            out.print("</table>");
            out.print("</div>");
          } else {
            session.setAttribute("msg", "No hay servicios/productos asociados a esta cotización");
            response.sendRedirect("../../mensaje.jsp");
          }
        %>
        <%-- lista de cotizaciones (fin) --%>

        <p style="text-align:center;">
          <a href="../principal/principal.jsp">Principal</a>
          &nbsp;&nbsp;&nbsp;
          <a href="../cotizacion/cotizacionQRY.jsp">Volver</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>
  </body>
</html>
