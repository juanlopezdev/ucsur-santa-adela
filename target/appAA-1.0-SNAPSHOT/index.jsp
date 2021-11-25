<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@page import="com.sql.ConectaDb" %>
<html>
    <head>
        <meta http-equiv="Content-Type"
              content="text/html; charset=UTF-8">
        <title>inicio</title>
        <style type="text/css">
            @import "css/estilos.css";
        </style>
    </head>
    <body>
        <div id="maincontainer">
            <div id="topsection">
                <%--<%@ include file="WEB-INF/jspf/top.jspf" %> --%>
             <div class ="wave" style="height: 100px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 80%; width: 100%;"><path d="M0.00,49.99 C150.00,150.00 349.20,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #08f;"></path></svg> </div> 
   
            </div>

            <div id="contentwrapper">
                <div id="centralsection">
                    <%@ include file="WEB-INF/jspf/central.jspf" %>
                    <img src= ".\images\logo.png" width = 300 border = 0>
                    <img src= ".\images\ejectu.jpg" width = 300 border = 0>
                </div>
            </div>

            <div id="leftsection">
                <%@ include file="WEB-INF/jspf/login.jspf" %>
               
            </div>

            <div id="footersection">
                <%@ include file="WEB-INF/jspf/footer.jspf" %>
            </div>
        </div>
    </body>
</html>

