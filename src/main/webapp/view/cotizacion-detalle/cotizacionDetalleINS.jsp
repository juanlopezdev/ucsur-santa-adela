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
          // Bloque de seguridad (inicio)
          BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
          if (usuario != null) {
        %>
        <h4>
          Bienvenido(a)
          <%=usuario.getNombres()%>
          <%=usuario.getApellidos()%>
        </h4>

        <%-- Pantalla para nueva cotización detalle (inicio) --%>
        <h3 class="center">Nuevo Servicio</h3>
        <div class="center">
          <form action="../../CotizacionDetalle" method="post">
            <input type="hidden" name="accion" value="INS">
            <input type="hidden" name="cod_cotizacion" value="<%=codCotizacion%>">
            <table style="margin:auto;text-align:left">
              <tr>
                <td>Nro.</td>
                <td>
                  <input type="number" name="nroitem" min="1">
                </td>
              </tr>

              <tr>
                <td>Tarifario</td>
                <td>
                  <%
                    List lstTarifario = Sql.consulta(
                            "SELECT "
                            + " cod_tarifario,"
                            + " servicio,"
                            + " descripcion,"
                            + " precio"
                            + " FROM tarifario"
                    );
                  %>
                  <select name="cod_tarifario" required>
                    <%
                      if (lstTarifario != null) {
                        for (int fil = 1; fil < lstTarifario.size(); ++fil) {
                          Object[] fila = (Object[]) lstTarifario.get(fil);
                          out.print("<option value='" + fila[0] + "'>" + fila[1] + " - " + fila[2] + " / S/ " + fila[3] + "</option>");
                        }
                      }
                    %>
                  </select>
                </td>
              </tr>

              <tr>
                <td>Cantidad</td>
                <td>
                  <input type="number" name="cantidad" min="1">
                </td>
              </tr>

              <tr>
                <td>Subtotal</td>
                <td>
                  <input type="number" name="subtotal" min="0" step="0.01">
                </td>
              </tr>

              <tr>
                <td>IGV</td>
                <td>
                  <input type="number" name="igv" min="0" step="0.01">
                </td>
              </tr>

              <tr>
                <td>Total</td>
                <td>
                  <input type="number" name="total" min="0" step="0.01">
                </td>
              </tr>

              <tr>
                <td colspan="2" class="center">
                  <input type="submit" value="Agregar Servicio">
                </td>
              </tr>
            </table>
          </form>
        </div>
        <%-- Pantalla para nueva cotización detalle (fin) --%>

        <%
          } else {
            // Bloque de seguridad (fin)
            session.setAttribute("msg", "No tiene accesos al móodulo");
            response.sendRedirect("mensaje.jsp");
          }
        %>

        <p class="center">
          <a href="../../Logout">Terminar Sesión</a>
          &nbsp;&nbsp;&nbsp;
          <a href="cotizacionDetalleQRY.jsp?cod_cotizacion=<%=codCotizacion%>">Volver</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file = "../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>

  </body>
</html>
