<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"
              content="text/html; charset=UTF-8">
        <title>Pagina en Construccion</title>
        <style type="text/css">
            @import "css/estilos.css";
        </style>
    </head>
    <body>
        <div id="maincontainer">
            <div id="topsection">
               <div class ="wave" style="height: 100px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg> </div> 
                <h1 style="text-align:center;color:#900">
                    
                    PAGINA EN CONSTRUCCION
               
                   
                </h1>
            </div>

            <div id="contentwrapper">
                <br>
                <p class="center">
                      <img src= ".\images/CONSTRUCTOR.png" width = 400 border = 0>
                </p>
                   
                   
                <p class="center">
                    <a href="Logout">Terminar Sesión</a>
                   
                   
                </p>
            </div>

            <div id="footersection">
                <%@ include file="WEB-INF/jspf/footer.jspf" %>
                  <p style="text-align:center;">
                   <a href="view/principal/principal.jsp"> Principal</a>
                </p>
               
            </div>
        </div>
    </body>
</html>

