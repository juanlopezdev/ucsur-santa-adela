<%@page import="controller.dao.DaoCliente"%>
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
                <%  // bloque de seguridad (inicio)
                    BeanUsuario usuario
                     = (BeanUsuario) session.getAttribute("usuario");
                    if (usuario != null) {
                %>
                <h4>Bienvenido(a)
                    <%=usuario.getNombres()%>
                    <%=usuario.getApellidos()%></h4>
                <% 
                  
                    String codigo = request.getParameter("cod_cliente");
                    /*String codigo = "8";*/
                   Object[] fila = Sql.getFila(
                    "select cod_cliente, razon_social, ruc, direccion, zona, giro, tipo_cuenta,estado " +
                    "from bdcmsa.cliente WHERE cod_cliente=" + codigo);
                   
                   /*Object[] fila = Sql.getFila(
                    "select cod_cliente, razon_social, ruc, direccion, zona, giro, tipo_cuenta,estado " +
                    "from bdcmsa.cliente WHERE cod_cliente='8'" );*/
                %>

                <h3 class="center">Editar Cliente</h3>
                <div class="center">
                   <form action="../../Cliente" method="post">
                    <input type="hidden" name="accion" value="UPD">
                    <input type="hidden" name="Cod_Cliente"
                           value="<%=codigo%>">
                    <p class="center">
                        <table style="text-align:left;border:0;">
                            <  <tr>
                                <td>Codigo</td>
                                <td>
                                    <input type="text" name="codigo"
                                           value="<%=fila[0].toString()%>"
                                           size="10" maxlength="80" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>Razon Social</td>
                                <td>
                                    <input type="text" name="razonsocial"
                                           value="<%=fila[1].toString()%>"
                                           size="50" maxlength="80" >
                                </td>
                            </tr>
                            
                            <tr>
                                <td>RUC</td>
                               <td>
                                    <input type="text" name="RUC"
                                           value="<%=fila[2].toString()%>"
                                           size="50" maxlength="80" >
                                </td>
                            </tr>
                            
                           <tr>
                             <td>Direccion</td>
                                <td>
                                    <input type="text" name="direccion"
                                           value="<%=fila[3].toString()%>"
                                           size="50" maxlength="80" >
                                </td>
                            </tr>
                             
                            <tr>
                                <td>Zona</td>
                                <td><select name="zona">
                                        <%if (fila[4].toString().compareTo("LIMA SUR") == 0) {%>
                                        <option value="LIMA SUR" selected>LIMA SUR</option>
                                        <option value="LIMA CENTRO">LIMA CENTRO</option>
                                        <option value="LIMA ESTE">LIMA ESTE</option>
                                        <option value="LIMA NORTE">LIMA NORTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                         <option value="PROVINCIA" >PROVINCIA</option>
                                        <%}%>
                                         <%if (fila[4].toString().compareTo("LIMA CENTRO") == 0) {%>
                                        <option value="LIMA CENTRO" selected>LIMA CENTRO</option>
                                        <option value="LIMA SUR">LIMA SUR</option>
                                        <option value="LIMA ESTE">LIMA ESTE</option>
                                        <option value="LIMA NORTE">LIMA NORTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                         <option value="PROVINCIA" >PROVINCIA</option>
                                        <%}%>
                                        <%if (fila[4].toString().compareTo("LIMA ESTE") == 0) {%>
                                        <option value="LIMA ESTE" selected>LIMA ESTE</option>
                                        <option value="LIMA CENTRO">LIMA CENTRO</option>
                                        <option value="LIMA SUR" >LIMA SUR</option>
                                        <option value="LIMA NORTE">LIMA NORTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                        <option value="PROVINCIA" >PROVINCIA</option>
                                        <%}%>
                                        <%if (fila[4].toString().compareTo("LIMA NORTE") == 0) {%>
                                        <option value="LIMA NORTE" selected>LIMA NORTE</option>
                                        <option value="LIMA CENTRO" selected>LIMA CENTRO</option>
                                        <option value="LIMA SUR" selected>LIMA SUR</option>
                                        <option value="LIMA ESTE">LIMA ESTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                        <option value="PROVINCIA" >PROVINCIA</option>
                                        <%}%>
                                        <%if (fila[4].toString().compareTo("CALLAO") == 0) {%>
                                        <option value="CALLAO" selected>CALLAO</option>
                                        <option value="LIMA CENTRO" >LIMA CENTRO</option>
                                        <option value="LIMA SUR" >LIMA SUR</option>
                                        <option value="LIMA ESTE">LIMA ESTE</option>
                                        <option value="LIMA NORTE">LIMA NORTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                        <option value="PROVINCIA" >PROVINCIA</option>
                                        <%}%>
                                          <%if (fila[4].toString().compareTo("PROVINCIA") == 0) {%>
                                        <option value="PROVINCIA" selected>PROVINCIA</option>
                                        <option value="LIMA CENTRO" >LIMA CENTRO</option>
                                        <option value="LIMA SUR" >LIMA SUR</option>
                                        <option value="LIMA ESTE">LIMA ESTE</option>
                                        <option value="LIMA NORTE">LIMA NORTE</option>
                                        <option value="CALLAO">CALLAO</option>
                                        <%}%>
                                </select></td>
                            </tr>
                            
                             <tr>
                                <td>Giro</td>
                                <td>
                                    <select name="Giro">
                                        <%if (fila[5].toString().compareTo("MANUFACTURA") == 0) {%>
                                        <option value="MANUFACTURA" selected>MANUFACTURA</option>
                                        <option value="PESQUERIA">PESQUERIA</option>
                                        <option value="SERVICIOS">SERVICIOS</option>
                                        <option value="GAS">GAS</option>
                                        <option value="OTROS">OTROS</option>
                                        <%}%>
                                        <%if (fila[5].toString().compareTo("PESQUERIA") == 0) {%>
                                        <option value="MANUFACTURA">MANUFACTURA</option>
                                        <option value="PESQUERIA" selected>PESQUERIA</option>
                                        <option value="SERVICIOS">SERVICIOS</option>
                                        <option value="GAS">GAS</option>
                                        <option value="OTROS">OTROS</option>
                                        <%}%>
                                        <%if (fila[5].toString().compareTo("SERVICIOS") == 0) {%>
                                        <option value="MANUFACTURA">MANUFACTURA</option>
                                        <option value="PESQUERIA" >PESQUERIA</option>
                                        <option value="SERVICIOS" selected>SERVICIOS</option>
                                        <option value="GAS">GAS</option>
                                        <option value="OTROS">OTROS</option>
                                        <%}%>
                                        <%if (fila[5].toString().compareTo("GAS") == 0) {%>
                                        <option value="MANUFACTURA">MANUFACTURA</option>
                                        <option value="PESQUERIA" >PESQUERIA</option>
                                        <option value="SERVICIOS" >SERVICIOS</option>
                                        <option value="GAS" selected>GAS</option>
                                        <option value="OTROS">OTROS</option>
                                        <%}%>
                                        <%if (fila[5].toString().compareTo("OTROS") == 0) {%>
                                        <option value="MANUFACTURA">MANUFACTURA</option>
                                        <option value="PESQUERIA" >PESQUERIA</option>
                                        <option value="SERVICIOS" >SERVICIOS</option>
                                        <option value="GAS">GAS</option>
                                        <option value="OTROS"selected>OTROS</option>
                                        <%}%>

                                    </select>
                                </td>
                             </tr>    
                             <tr>
                                <td>Tipo_Cuenta</td>
                                <td>
                                    <select name="Tipo_Cuenta">
                                        <%if (fila[6].toString().compareTo("MICRO") == 0) {%>
                                        <option value="MICRO" selected>MICRO</option>
                                        <option value="MEDIANO">MEDIANO</option>
                                        <option value="GRANDE">GRANDE</option>
                                        <%}%>
                                        <%if (fila[6].toString().compareTo("MEDIANO") == 0) {%>
                                        <option value="MICRO" >MICRO</option>
                                        <option value="MEDIANO"selected>MEDIANO</option>
                                        <option value="GRANDE">GRANDE</option>
                                        <%}%>
                                        <%if (fila[6].toString().compareTo("GRANDE") == 0) {%>
                                        <option value="MICRO" >MICRO</option>
                                        <option value="MEDIANO">MEDIANO</option>
                                        <option value="GRANDE" selected>GRANDE</option>
                                        <%}%>
                            
                                    </select>
                                </td>
                             </tr>
                             <tr>
                                <td>Estado</td>
                                <td>
                                    <select name="Estado">
                                        <%if (fila[7].toString().compareTo("ACTIVO") == 0) {%>
                                        <option value="ACTIVO" selected>ACTIVO</option>
                                        <option value="NO ACTIVO">NO ACTIVO</option>
                                        <%}%>
                                        <%if (fila[7].toString().compareTo("NO ACTIVO") == 0) {%>
                                        <option value="ACTIVO" >ACTIVO</option>
                                        <option value="NO ACTIVO"selected>NO ACTIVO</option>
                                        <%}%>
                                    </select>
                                </td>
                             </tr> 
                            <tr>
                                <td colspan="2" class="center">
                                    <input type="submit" value="Actualizar Cliente">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <%-- pantalla para nuevo Usuario (fin) --%>

                <%} else {  // bloque de seguridad (fin)
                        session.setAttribute("msg", "No tiene usuario");
                        response.sendRedirect("mensaje.jsp");
                    }%>

                <p class="center">
                    <a href="../../Logout">Terminar Sesión</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="clienteQRY.jsp">Volver</a>
                </p>
            </div>

            <div id="footersection">
                <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>

    </body>
</html>
