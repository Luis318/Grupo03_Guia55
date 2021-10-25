<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
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
    <body >
        
        <div id="container">
            <c:if test="${not empty param.msg}">
                <p style="color:red;">Error: ${param.msg}</p>
            </c:if>
            <form name="login" action="validar.jsp" method="post">
                <!-- Username -->
               
                <table class="log">
                     <tr>
                        <th><h1>Inicio de sesión</h1></th>
                    </tr>
                    <tr>
                        <th>
                             <label for="usuario">Usuario:</label>
                        </th>
                        <th>
                            <input name="usuario" id="usuario" type="input" value="">
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <label for="clave">Contraseña:</label>
                              
                        </th>
                        <th>
                            <input name="clave" id="clave" type="password">
                        </th>
                   
                    </tr>
                    <tr>
                        
                             <th> <div id="lower">
                   
                                 <input class="butto" type="submit" value="Validar">
                             </div></th>
                    </tr>
                  
                </table>
                
            </form>       
        </div>
    </body>
</html>
