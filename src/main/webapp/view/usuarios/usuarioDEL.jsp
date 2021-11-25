<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page import="model.BeanUsuario" %>
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
                <%@ include file="../../WEB-INF/jspf/top.jspf" %>
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
                    String idUsuario = request.getParameter("idUsuario");
                    Object[] fila = Sql.getFila(
                            "SELECT nombres,apellidos " +
                            "FROM usuarios WHERE idUsuario=" + idUsuario);
                %>
                <form action="../../Usuario" method="post">
                    <input type="hidden" name="accion" value="DEL">
                    <input type="hidden" name="idUsuario"
                           value="<%=idUsuario%>">
                    <p class="center">
                        <table style="text-align:left;border:0;">
                            <tr>
                                <td>Nombres</td>
                                <td>
                                    <input type="text" name="nombres" value="<%=fila[0].toString()%>"
                                           size="30" maxlength="30" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>Apellidos</td>
                                <td>
                                    <input type="text" name="apellidos" value="<%=fila[1].toString()%>"
                                           size="30" maxlength="30" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td class="center" colspan="2">
                                <input type="submit" value="Retirar a este Usuario">
                                </td>
                            </tr>
                        </table>
                    </p>
                </form>
                <%-- pantalla muestra nombres del usuario a Retirar (fin) --%>

                <%} else {  // bloque de seguridad (fin)
            session.setAttribute("msg", "Ingreso incorrecto");
            response.sendRedirect("mensaje.jsp");
        }%>

                <p class="center">
                    <a href="../../Logout">Terminar Sesi&oacute;n</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="accesoAdmin.jsp">Volver</a>
                </p>
            </div>

            <div id="footersection">
                <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>
    </body>
</html>
