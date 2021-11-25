<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page import="model.BeanUsuario" %>
<%@page import="com.sql.Sql" %>
<%@page import="com.Combo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            @import "../../css/estilos.css";
        </style>
        <script type="text/javascript">
            window.onload = function() {
                if (window.history.forward(1)) {
                    window.history.go(-1)
                }
            }

            var idCorreo;
            var idTelefono;
            // inicia idCorreo antes del clic
            function cargaIdCorreo() {
                idCorreo = document.forms[0].idCorreo.options[0].value;
            }

            // con cada clic se actualiza el idCorreo
            function correo(idCombo, form) {
                idCorreo = idCombo;
            }

            function enviaIdCorreo(doc) {
                window.location.href = doc + "?idCorreo=" + idCorreo
            }

            // inicia idTelefono antes del clic
            function cargaIdTelefono() {
                idTelefono = document.forms[0].idTelefono.options[0].value;
            }

            // con cada clic se actualiza el idCorreo
            function telefono(idCombo, form) {
                idTelefono = idCombo;
            }

            function enviaIdTelefono(doc) {
                window.location.href = doc + "?idTelefono=" + idTelefono
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

                <%-- pantalla para ver y modificar datos de ADMIN (inicio) --%>
                <form action="Usuario" method="post">
                    <input type="hidden" name="accion" value="UPD">
                    <input type="hidden" name="idUsuario" value="<%=usuario.getIdUsuario()%>">
                    <p class="center">
                        <table style="text-align:left;border:0;margin:auto">
                            <tr>
                                <td>Nombres</td>
                                <td>
                                    <input type="text" name="nombres" value="<%=usuario.getNombres()%>"
                                           size="30" maxlength="30">
                                </td>
                            </tr>
                            <tr>
                                <td>Apellidos</td>
                                <td>
                                    <input type="text" name="apellidos" value="<%=usuario.getApellidos()%>"
                                           size="30" maxlength="30">
                                </td>
                            </tr>
                            <tr>
                                <td>Correos</td>
                                <td>
                                    <%
                    out.print(Combo.comboHtml2(
                            "SELECT idCorreo,correo " +
                            "FROM correos WHERE idUsuario=" +
                            usuario.getIdUsuario(), "idCorreo", "correo"));
                                    %>
                                    <script type="text/javascript">
                                        // inicia idCorreo antes del clic
                                        cargaIdCorreo();
                                    </script>
                                    <a href="../correos/correoINS.jsp">
                                        <img src="../../images/ins.gif" border="0" width="16"></a>&nbsp;
                                    <a href="#" onclick=
                                        "enviaIdCorreo('../correos/correoDEL.jsp')">
                                        <img src="../../images/del.gif" border="0" width="16"></a>&nbsp;
                                    <a href="#" onclick=
                                        "enviaIdCorreo('../correos/correoUPD.jsp')">
                                        <img src="../../images/upd.gif" border="0" width="16"></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Tel&eacute;fonos</td>
                                <td>
                                    <%
                    out.print(Combo.comboHtml2(
                            "SELECT idTelefono,telefono " +
                            "FROM telefonos WHERE idUsuario=" +
                            usuario.getIdUsuario(), "idTelefono", "telefono"));
                                    %>
                                    <script type="text/javascript">
                                        cargaIdTelefono();
                                    </script>
                                    <a href="../telefonos/telefonoINS.jsp">
                                        <img src="../../images/ins.gif"
                                         border="0" width="16"></a>&nbsp;
                                    <a href="#" onclick= "enviaIdTelefono('../telefonos/telefonoDEL.jsp')">
                                        <img src="../../images/del.gif"
                                         border="0" width="16"></a>&nbsp;
                                    <a href="#" onclick=
                                        "enviaIdTelefono('../telefonos/telefonoUPD.jsp')">
                                        <img src="../../images/upd.gif" border="0" width="16"></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Login</td>
                                <td>
                                    <input type="text" name="login"
                                           value="<%=usuario.getLogin()%>"
                                           size="10" maxlength="10">
                                </td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <input type="password" name="password"
                                           value="<%=usuario.getPassword()%>"
                                           size="10" maxlength="10">
                                </td>
                            </tr>
                            <tr>
                                <td>Autorizaci&oacute;n</td>
                                <td><select name="autorizacion">
                                        <%if (usuario.getAutorizacion().compareTo("USER") == 0) {%>
                                        <option value="USER" selected>USER</option>
                                        <option value="ADMIN">ADMIN</option>
                                        <%} else {%>
                                        <option value="USER">USER</option>
                                        <option value="ADMIN" selected>ADMIN</option>
                                        <%}%>
                                </select></td>
                            </tr>
                            <tr>
                                <td class="center" colspan="2">
                                    <input type="submit"
                                           value="Actualizar datos">
                                </td>
                            </tr>
                        </table>
                    </p>
                </form>
                <%-- pantalla para ver y modificar datos de ADMIN (inicio) --%>

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
