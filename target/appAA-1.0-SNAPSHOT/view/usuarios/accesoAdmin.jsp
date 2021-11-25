<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="com.sql.Sql" %>
<%@page import="java.util.List" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
                <%@ include file="../../WEB-INF/jspf/top.jspf" %>
            </div>

            <div id="contentwrapper">
                <%  // bloque java de seguridad
                    BeanUsuario usuario
                            = (BeanUsuario) session.getAttribute("usuario");
                    if (usuario != null) {
                %>
                <h4>Bienvenido(a)
                    <%=usuario.getNombres()%>
                    <%=usuario.getApellidos()%>
                </h4>

                <%-- pantalla para administrador (inicio) --%>
                <%
                    List list = Sql.consulta(
                            "SELECT idUsuario,nombres,apellidos,autorizacion FROM usuarios");
                    if (list != null) {
                        out.print("<div class='center'>");
                        out.print("<table style='width:80%;margin:auto;' border='0'><tr><td>");
                        out.print("<a href='usuarioINS.jsp'>"
                                + "<img src='../../images/ins.gif' border='0'>"
                                + "Crear Usuario</a>");
                        out.print("</td><td>");
                        out.print("<a href='usuarioAdminUPD.jsp'>"
                                + "<img src='../../images/upd.gif' border='0'>"
                                + "Ver mis datos</a>");
                        out.print("</td></tr></table>");
                        out.print("<table style='width:80%;margin:auto;' border='1'>");
                        for (int fil = 0; fil < list.size(); ++fil) {
                            Object[] fila = (Object[]) list.get(fil);
                            out.print("<tr>");
                            for (int col = 1; col < fila.length; ++col) {
                                out.print("<td>" + fila[col] + "</td>");
                            }

                            if (fil == 0) {
                                out.print("<td class='center'>Acceso</td>"
                                        + "<td class='center'>Retirar</td>");
                            } else {
                                out.print("<td class='center'><a href='usuarioAUT.jsp?idUsuario="
                                        + fila[0] + "'>"
                                        + "<img src='../../images/aut.gif' border='0'></a></td>");
                                out.print("<td class='center'><a href='usuarioDEL.jsp?idUsuario="
                                        + fila[0] + "'>"
                                        + "<img src='../../images/del.gif' border='0'></a></td>");
                            }
                            out.print("</tr>");
                        }
                        out.print("</table></div>");

                    } else {
                        session.setAttribute("msg", "No hay acceso a Usuarios");
                        response.sendRedirect("mensaje.jsp");
                    }
                %>
                <%-- pantalla para administrador (fin) --%>

                <%} else { // bloque java de seguridad
                        request.getSession().setAttribute("msg",
                                "Acceso incorrecto!");
                        response.sendRedirect("mensaje.jsp");
                    }%>
                <p style="text-align:center;">
                    <a href="../../Logout">Terminar Sesi&oacute;n</a>
                </p>
            </div>

            <div id="footersection">
                <%@ include file="../../WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>
    </body>
</html>
