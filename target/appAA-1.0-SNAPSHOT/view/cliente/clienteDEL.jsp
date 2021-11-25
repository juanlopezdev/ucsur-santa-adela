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
            window.onload = function() {
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
        BeanUsuario usuario =
        (BeanUsuario) session.getAttribute("usuario");
        if (usuario != null) {
                %>
                <h4>Bienvenido(a)
                    <%=usuario.getNombres()%>
                <%=usuario.getApellidos()%></h4>

                <%-- pantalla muestra nombres del usuario a Retirar (inicio) --%>
                <%
                    String codigo = request.getParameter("cod_cliente");
                    Object[] fila = Sql.getFila(
                            "SELECT cod_cliente, RUC,razon_social " +
                            "FROM bdcmsa.cliente WHERE cod_cliente=" + codigo);
                %>
                <form action="../../Cliente" method="post">
                    <input type="hidden" name="accion" value="DEL">
                    <input type="hidden" name="cod_cliente"
                           value="<%=codigo%>">
                    <p class="center">
                        <table style="text-align:left;border:0;">
                              <tr>
                                <td>Codigo</td>
                                <td>
                                    <input type="text" name="codigo" value="<%=fila[0].toString()%>"
                                           size="10" maxlength="10" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>RUC</td>
                                <td>
                                    <input type="text" name="RUC" value="<%=fila[1].toString()%>"
                                           size="11" maxlength="11" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>Razon Social</td>
                                <td>
                                    <input type="text" name="razonsocial" value="<%=fila[2].toString()%>"
                                           size="50" maxlength="50" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td class="center" colspan="2">
                                <input type="submit" value="Retirar a este Cliente">
                                </td>
                            </tr>
                        </table>
                    
                </form>

                <%} else {  // bloque de seguridad (fin)
            session.setAttribute("msg", "Ingreso incorrecto");
            response.sendRedirect("mensaje.jsp");
        }%>

                <p class="center">
                    <a href="../../Logout">Terminar Sesi&oacute;n</a>
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
