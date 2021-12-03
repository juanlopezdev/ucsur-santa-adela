<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.BeanUsuario" %>
<%@page import="model.BeanCliente" %>
<%@page import="com.sql.Sql" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style type="text/css">
      @import "../../css/estilos.css";
    </style>
    <script>
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
        <%  // bloque de seguridad (inicio)
          BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
          if (usuario != null) {
        %>
        <h4>
          Bienvenido(a)
          <%=usuario.getNombres()%>
          <%=usuario.getApellidos()%>
        </h4>

        <%-- Pantalla muestra nombres del usuario a Retirar (inicio) --%>
        <%
          String codigo = request.getParameter("cod_cotizacion");
          Object[] fila = Sql.getFila(
                  "SELECT "
                  + " cotizacion.cod_cotizacion,"
                  + " cotizacion.cod_cliente,"
                  + " cliente.razon_social,"
                  + " usuarios.idUsuario,"
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
                  + " WHERE cod_cotizacion = " + codigo);
        %>
        <div class="center">
          <form action="../../Cotizacion" method="post">
            <input type="hidden" name="accion" value="DEL">
            <input type="hidden" name="codigo" value="<%=codigo%>">
            <input type="hidden" name="cod_cliente" value="<%=fila[1].toString()%>">
            <input type="hidden" name="idUsuario" value="<%=fila[3].toString()%>">
            <table style="margin:auto;text-align:left">
              <tr>
                <td>Cliente</td>
                <td>
                  <input type="text" value="<%=fila[2].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>Usuario</td>
                <td>
                  <input type="text" value="<%=fila[4].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>Fecha de Cotización</td>
                <td>
                  <input type="date" value="<%=fila[5].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>Subtotal</td>
                <td>
                  <input type="number" value="<%=fila[6].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>IGV</td>
                <td>
                  <input type="number" value="<%=fila[7].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>Total</td>
                <td>
                  <input type="number" value="<%=fila[8].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td>Estado cotización</td>
                <td>
                  <input type="text" value="<%=fila[9].toString()%>" readonly>
                </td>
              </tr>
              <tr>
                <td class="center" colspan="2">
                  <input type="submit" value="Retirar esta cotización">
                </td>
              </tr>
            </table>
          </form>
        </div>
        <%
          } else {  // bloque de seguridad (fin)
            session.setAttribute("msg", "Ingreso incorrecto");
            response.sendRedirect("mensaje.jsp");
          }
        %>

        <p class="center">
          <a href="../../Logout">Terminar Sesi&oacute;n</a>
          &nbsp;&nbsp;&nbsp;
          <a href="cotizacionQRY.jsp">Volver</a>
        </p>
      </div>

      <div id="footersection">
        <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
      </div>
    </div>
  </body>
</html>
