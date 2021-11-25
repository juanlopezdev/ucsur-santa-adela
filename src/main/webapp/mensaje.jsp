<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"
              content="text/html; charset=UTF-8">
        <title>Login Fallo</title>
        <style type="text/css">
            @import "css/estilos.css";
        </style>
    </head>
    <body>
        <div id="maincontainer">
            <div id="topsection">
               <div class ="wave" style="height: 100px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg> </div> 
            </div>

            <div id="contentwrapper">
                <br>
                <h3 style="text-align:center;color:#900">
                    <%
        String msg =
                (String) request.getSession().getAttribute("msg");

        if (msg != null) {
            out.print(msg);
        } else {
            out.print("Ingreso no autorizado");
        }
                    %>
                </h3>

                <p class="center">
                    <a href="Logout">Terminar Sesión</a>
                </p>
            </div>

            <div id="footersection">
                <%@ include file="WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>
    </body>
</html>

