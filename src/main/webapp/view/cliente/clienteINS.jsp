<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="model.BeanCliente" %>
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

        <%-- Pantalla para nuevo Usuario (inicio) --%>
        <h3 class="center">Nuevo Cliente</h3>
        <div class="center">
          <form action="../../Cliente" method="post">
            <table style="margin:auto;text-align:left">
              <input type="hidden" name="accion" value="INS">
              <tr>
                <td>Razon Social</td>
                <td>
                  <input type="text" name="razonsocial" size="50">
                </td>
              </tr>

              <tr>
                <td>RUC</td>
                <td>
                  <input type="text" name="RUC" size="50">
                </td>
              </tr>

              <tr>
                <td>Direccion</td>
                <td>
                  <input type="text" name="direccion" size="50">
                </td>
              </tr>

              <tr>
                <td>Zona</td>
                <td>
                  <select name="zona">
                    <option value="LIMA SUR">LIMA SUR</option>
                    <option value="LIMA CENTRO">LIMA CENTRO</option>
                    <option value="LIMA ESTE">LIMA ESTE</option>
                    <option value="LIMA NORTE">LIMA NORTE</option>
                    <option value="CALLAO">CALLAO</option>
                    <option value="PROVINCIA">PROVINCIA</option>
                  </select>
                </td>
              </tr>  
              <tr>
                <td>Giro</td>
                <td>
                  <select name="Giro">
                    <option value="MANUFACTURA">MANUFACTURA</option>
                    <option value="PESQUERIA">PESQUERIA</option>
                    <option value="SERVICIOS">SERVICIOS</option>
                    <option value="GAS">GAS</option>
                    <option value="OTROS">OTROS</option>
                  </select>
                </td>
              </tr>    
              <tr>
                <td>Tipo Cuenta</td>
                <td>
                  <select name="Tipo_Cuenta">
                    <option value="MICRO">MICRO</option>
                    <option value="MEDIANO">MEDIANO</option>
                    <option value="GRANDE">GRANDE</option>

                  </select>
                </td>
              </tr>
              <tr>
                <td>Estado</td>
                <td>
                  <select name="Estado">
                    <option value="ACTIVO">ACTIVO</option>
                    <option value="NO ACTIVO">NO ACTIVO</option>
                  </select>
                </td>
              </tr> 
              <tr>
                <td colspan="2" class="center">
                  <input type="submit" value="Crear Cliente">
                </td>
              </tr>
            </table>
          </form>
        </div>
        <%-- Pantalla para nuevo Usuario (fin) --%>

        <%
          } else {
            // Bloque de seguridad (fin)
            session.setAttribute("msg", "No tiene usuario");
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
