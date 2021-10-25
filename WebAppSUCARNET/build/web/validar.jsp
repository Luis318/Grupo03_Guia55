<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VALIDACION DE USUARIOS</title>
    </head>
    <style>
            .datos {
                width: 800px;
                background: #24303c;
                padding: 30px;
                margin: auto;
                margin-top: 100px;
                border-radius: 4px;
                font-family: 'calibri';
                color: white;
                box-shadow: 7px 13px 37px #000;
            }
            body {
                background: url('fondo.jpg');
                background-size: cover;
                 

            }
            .error6{
               font-family: 'calibri';
                color: white; 
            }
            
        </style>
    <body>
        <h1 style=" .butto{
              width: auto;
        background: #24303c;
        padding: 15px;
        margin: auto;
        font-weight: 900;
        border-radius: 20px;
        font-family: 'calibri';
        color: white;
        box-shadow: 7px 13px 37px #000;
        
        }">Verificación de Usuarios</h1>
        <div class="error6">
        <c:if test="${empty param.usuario or empty param.clave}">
            <c:redirect url="frmlogin.jsp">
                <c:param name="msg" value="Usuario o clave vacios"/>
            </c:redirect>
        </c:if>
        </div>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT count(*) as cant from users where login=? and password=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:if test="${result.rows[0].cant < 1}"> 
            <c:redirect url="frmlogin.jsp">
                <c:param name="msg" value="Usuario o clave incorrectos"/>
            </c:redirect>
        </c:if> 
        <sql:query dataSource = "${fuenteDatos}" var = "datos">
            SELECT login,nombre,nivel from users where login=? and password=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:set var="user" value="${datos.rows[0].login}" scope="session" />
        <c:set var="nombre" value="${datos.rows[0].nombre}" scope="session" />
        <c:set var="nivel" value="${datos.rows[0].nivel}" scope="session" />
        <p style="color:white; font-family: 'calibri';border-radius: 20px; box-shadow: 7px 13px 37px #000;background: #24303c;padding: 15px;
        margin: auto;"><br>En unos segundos se redirijirá a la pagina de INICIO<br></p>
                <script>
            setTimeout(function () {
                location.href = "index.jsp";
            }, 5000);
        </script>
    </body>