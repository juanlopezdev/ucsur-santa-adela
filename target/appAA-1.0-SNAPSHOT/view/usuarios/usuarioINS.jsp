<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="model.BeanUsuario" %>
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

                <%-- pantalla para nuevo Usuario (inicio) --%>
                <h3 class="center">Nuevo Usuario</h3>
                <div class="center">
                    <form action="../../Usuario" method="post">
                        <table style="margin:auto;text-align:left">
                            <input type="hidden" name="accion" value="INS">
                            <tr>
                                <td>Nombres</td>
                                <td>
                                    <input type="text" name="nombres" size="30"
                                       maxlength="30"></td>
                            </tr>
                            <tr>
                                <td>Apellidos</td>
                                <td>
                                    <input type="text" name="apellidos"
                                       size="30" maxlength="30"></td>
                            </tr>
                            <tr>
                                <td>Login</td>
                                <td>
                                    <input type="text" name="login"
                                       size="10" maxlength="10"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <input type="password" name="password"
                                       size="10" maxlength="10"> </td>
                            </tr>
                            <tr>
                                <td>Autorización</td>
                                <td><select name="autorizacion">
                                        <option value="USER">USER</option>
                                        <option value="ADMIN">ADMIN</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="center">
                                    <input type="submit" value="Crear Usuario">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <%-- pantalla para nuevo Usuario (fin) --%>

                <%} else {  // bloque de seguridad (fin)
            session.setAttribute("msg", "Ingreso incorrecto");
            response.sendRedirect("mensaje.jsp");
        }%>

                <p class="center">
                    <a href="../../Logout">Terminar Sesión</a>
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