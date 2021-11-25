<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@page import="model.BeanUsuario" %>
<%@page import="com.sql.Sql" %>
<%@page import="java.util.List" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <style type="text/css">
            @import "../../css/estilos.css";
            @import "../../css/links.css";
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
            <div class ="wave" style="height: 100px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg> </div> 
            <div id="topsection">
               <%--<%@ include file="/WEB-INF/jspf/top.jspf"  --%>
                <%  // bloque java de seguridad
                    BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
                    if (usuario != null) {
                %>
                <h4>Bienvenido(a): <br>
                    <%=usuario.getNombres()%>
                    <%=usuario.getApellidos()%>
                </h4>
                <%}%>
            </div>

            <div id="contentwrapper">
                
                <div id="centralsection">
                    
                    <%-- <%@ include file="/WEB-INF/jspf/central.jspf" %> --%>
                     <img src="../../images/logo.png" width = 300 border = 0>
                    <img src="../../images/ejectu.jpg" width = 300 border = 0>
                </div>
                     
            </div>

            <div id="leftsection" class="menu">
                <%@ include file="/WEB-INF/jspf/menu.jspf" %>
            </div>

            <div id="footersection">
                <%@ include file="/WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>
        
    </body>
</html>
