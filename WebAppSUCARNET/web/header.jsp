<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="enca" border="1" width="100%" style="text-align: center;">
    <tr>
        <td><b>Grupo 3</b>
            
        </td>
        <td><b> Mantenimiento de Libros</b>
           <br>
            <b style="color:background;">${sessionScope.nombre}</b>
        </td>
        <td>
    
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <span style="color:wheat;font-size:5mm;">
                  Nivel de acceso: ${sessionScope.nivel}</span><br>
                  <a class="cerrar"href="logout.jsp"><b>Cerrar sesión</b></a>
              </c:if>
          </c:if>
        
   
    <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
          <span style="color:brown;font-size:5mm;">
              <a href="frmlogin.jsp"><b>Login</b></a>
        </span>
    </c:if>
</td>
</tr>    
</table>

     
<style>
        
    .enca{
        color: white;
        font-family: 'calibri';
        font-size: 23px;
        padding: 30px;
        box-shadow: 7px 13px 37px #000;
        background: #24303c;
        border-radius: 5px;
         border-bottom-color: black;
        
    }
   
    a{
         color: white;
        font-family: 'calibri';
        font-size: 23px;
        
    }
    .cerrar{
        color:brown;
        font-size: 22px;
    }
    
    </style>
