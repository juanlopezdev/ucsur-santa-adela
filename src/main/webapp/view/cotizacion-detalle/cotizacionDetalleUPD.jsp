<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="com.sql.Sql" %>
<%@page import="java.util.List" %>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuevo</title>
    <style type="text/css">
      @import "../../css/estilos.css";
    </style>
    <script type="text/javascript">
      window.onload = function () {
        if (window.history.forward(1)) {
          window.history.go(-1)
        }
      }
    </script>

  </head>
  <body>

    <div id="maincontainer">
      <div id="topsection">
        <div class ="wave" style="height: 100px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg> </div> 
      </div>

      <div id="contentwrapper">
        <%
          String codCotizacion = request.getParameter("cod_cotizacion");
          String codTarifario = request.getParameter("cod_tarifario");

          // bloque de seguridad (inicio)
          BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
          if (usuario != null) {
        %>
        <h4>Bienvenido(a)
          <%=usuario.getNombres()%>
          <%=usuario.getApellidos()%>
        </h4>

        <%-- Pantalla para actualizar Cotización (inicio) --%>
        <%
          Object[] fila = Sql.getFila(
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
                  + " WHERE cotizacion_detalle.cod_cotizacion = " + codCotizacion
                  + " AND cotizacion_detalle.cod_tarifario = " + codTarifario);
        %>

        <h3 class="center">Editar Cotización Detalle</h3>
        <div class="center">
          <form action="../../CotizacionDetalle" method="post">
            <input type="hidden" name="accion" value="UPD">
            <input type="hidden" name="cod_cotizacion" value="<%=codCotizacion%>">
            <input type="hidden" name="cod_tarifario" value="<%=codTarifario%>">
            <table style="margin:auto;text-align:left">
              <tr>
                <td>Nro.</td>
                <td>
                  <input type="number" name="nroitem" min="1" value="<%=fila[2].toString()%>">
                </td>
              </tr>

              <tr>
                <td>Tarifario</td>
                <td>
                  <input type="text" style="width: 300px" readonly value="<%=fila[3] + " - " + fila[4] + " / S/ " + fila[5]%>">
                </td>
              </tr>

              <tr>
                <td>Cantidad</td>
                <td>
                  <input type="number" name="cantidad" value="<%=fila[6].toString()%>">
                </td>
              </tr>

              <tr>
                <td>Subtotal</td>
                <td>
                  <input type="number" name="subtotal" min="0" value="<%=fila[7].toString()%>" step="0.01">
                </td>
              </tr>

              <tr>
                <td>IGV</td>
                <td>
                  <input type="number" name="igv" min="0" value="<%=fila[8].toString()%>" step="0.01">
                </td>
              </tr>

              <tr>
                <td>Total</td>
                <td>
                  <input type="number" name="total" min="0" value="<%=fila[9].toString()%>" step="0.01">
                </td>
              </tr>

              <tr>
                <td colspan="2" class="center">
                  <input type="submit" value="Actualizar Cotización Detalle">
                </td>
              </tr>
            </table>
          </form>
        </div>
        <%-- Pantalla para actualizar Cotización (fin) --%>

        <%} else {  // bloque de seguridad (fin)
            session.setAttribute("msg", "No tiene acceso a este módulo");
            response.sendRedirect("mensaje.jsp");
          }%>

        <p class="center">
          <a href="../../Logout">Terminar Sesión</a>
          &nbsp;&nbsp;&nbsp;
          <a href="cotizacionDetalleQRY.jsp?cod_cotizacion=<%=codCotizacion%>">Volver</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>

  </body>
</html>
