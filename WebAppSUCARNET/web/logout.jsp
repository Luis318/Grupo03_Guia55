<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CERRAR SESION</title>
    </head>
     <style>
        
        .log {
        width: auto;
        background: #24303c;
        padding: 15px;
        margin: auto;
        margin-top: 100px;
        border-radius: 10px;
        font-family: 'calibri';
        color: white;
        box-shadow: 7px 13px 37px #000;
        }
        body{
            background: url('fondo.jpg');
            background-size: cover;
           
                

        }
        
        .butto{
              width: auto;
        background: #24303c;
        padding: 15px;
        margin: auto;
        font-weight: 900;
        border-radius: 20px;
        font-family: 'calibri';
        color: white;
        box-shadow: 7px 13px 37px #000;
        
        }
    </style>
    <body>
        <h1 class="butto">ACABA DE CERRAR SESION</h1>
        <c:set var="user" value="" scope="session" />
        <c:set var="nombre" value="" scope="session" />
        <c:set var="nivel" value="-1" scope="session" />
       
                 <p style="color:white; font-family: 'calibri';border-radius: 20px; box-shadow: 7px 13px 37px #000;background: #24303c;padding: 15px;
        margin: auto;">
                            <br>Dentro de unos segundos sera redirigido a la pagina de INICIO</p>
        <script>
                setTimeout(function () {
                    location.href = "index.jsp";
                }, 5000);
            </script>

    </body>
</html>
