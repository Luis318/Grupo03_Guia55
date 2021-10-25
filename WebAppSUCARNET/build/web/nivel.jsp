
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO DE SESION</title>
    </head>
    <body>
        <h1>CAMBIAR DE USUARIO RAPIDO SIN LOGEO</h1>
        <c:choose >
            <c:when test="${param.n eq 1}">
                <c:set var="user" scope="session" value="Digitador"/>
                <c:set var="nivel" scope="session" value="1"/>
                <c:set var="nombre" scope="session" value="Usuario para ingresar y ver"/>
            </c:when>
            <c:when test="${param.n eq 2}">
                <c:set var="user" scope="session" value="Mantenimiento"/>
                <c:set var="nivel" scope="session" value="2"/>
                <c:set var="nombre" scope="session" value="Usuario para actualizar o borrar"/>
            </c:when>            
            
            <c:when test="${param.n eq 0}">
                <c:set var="user" scope="session" value="Anonimo"/>
                <c:set var="nivel" scope="session" value="0"/>
                <c:set var="nombre" scope="session" value="Usuario solo de consulta y ver"/>
            </c:when>
        </c:choose>
        <p style="color:#f0f0f0;">
            <br><b>Inicio de sesión completado, regresando a INICIO</b></p>
        <script>
            setTimeout(function () {
                location.href = "index.jsp";
            }, 1000);
        </script>
    </body>
</html>