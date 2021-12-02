<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="model.BeanCotizacion" %>
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
          // Bloque de seguridad (inicio)
          BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
          if (usuario != null) {
        %>
        <h4>
          Bienvenido(a)
          <%=usuario.getNombres()%>
          <%=usuario.getApellidos()%>
        </h4>

        <%-- Pantalla para nueva cotización (inicio) --%>
        <h3 class="center">Nueva Cotización</h3>
        <div class="center">
          <form action="../../Cotizacion" method="post">
            <table style="margin:auto;text-align:left">
              <input type="hidden" name="accion" value="INS">
              <input type="hidden" name="idUsuario" value="<%=usuario.getIdUsuario()%>">
              <tr>
                <td>Cliente</td>
                <td>
                  <%
                    List lstClientes = Sql.consulta(
                            "SELECT "
                            + " cod_cliente,"
                            + " CONCAT(razon_social, ', RUC:', ruc) as cliente"
                            + " FROM cliente "
                    );
                  %>
                  <select name="cod_cliente" required>
                    <%
                      if (lstClientes != null) {
                        for (int fil = 1; fil < lstClientes.size(); ++fil) {
                          Object[] fila = (Object[]) lstClientes.get(fil);
                          out.print("<option value='" + fila[0] + "'>" + fila[1] + "</option>");
                        }
                      }
                    %>
                  </select>
                </td>
              </tr>

              <tr>
                <td>Fecha de Cotización</td>
                <td>
                  <input type="date" name="fecha_cotizacion" size="50">
                </td>
              </tr>

              <tr>
                <td>Subtotal</td>
                <td>
                  <input type="number" name="subtotal" min="0">
                </td>
              </tr>

              <tr>
                <td>IGV</td>
                <td>
                  <input type="number" name="igv" min="0">
                </td>
              </tr>

              <tr>
                <td>Total</td>
                <td>
                  <input type="number" name="total" min="0">
                </td>
              </tr>

              <tr>
                <td>Estado Cotización</td>
                <td>
                  <select name="estado_cotizacion">
                    <option value="PENDIENTE">PENDIENTE</option>
                    <option value="CERRADA">CERRADA</option>
                    <option value="RECHAZADA">RECHAZADA</option>
                  </select>
                </td>
              </tr>

              <tr>
                <td colspan="2" class="center">
                  <input type="submit" value="Crear Cotización">
                </td>
              </tr>
            </table>
          </form>
        </div>
        <%-- Pantalla para nueva cotización (fin) --%>

        <%
          } else {
            // Bloque de seguridad (fin)
            session.setAttribute("msg", "No tiene cotización");
            response.sendRedirect("mensaje.jsp");
          }
        %>

        <p class="center">
          <a href="../../Logout">Terminar Sesión</a>
          &nbsp;&nbsp;&nbsp;
          <a href="clienteQRY.jsp">Volver</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file = "../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>

  </body>
</html>
