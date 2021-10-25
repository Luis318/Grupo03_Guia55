<%-- 
    Document   : insert.jsp
    Created on : 23/10/2021, 04:03:02 PM
    Author     : kevin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Registro</title>
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        
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
        h1{
            color: white;
            font-size: 50px;
           background: black;
            margin: auto;
        
             
           
        }
        h2{
            color:wheat;
            font-size: 25px;
           background:darkslateblue;
            margin: auto; 
        }
        .datos2 {
            width: 1000px;
            background: #24303c;
            padding: 15px;
            margin: auto;
            margin-top: 100px;
            border-radius: 10px;
            font-family: 'calibri';
            color: white;
            box-shadow: 7px 13px 37px #000;
        }
        body {
            background: url('fondo.jpg');
            background-size: cover;

        }
    </style>
    <body>
          <a href="index.jsp" name="regesar" class="btn btn-primary">INICIO</a>
    
        <%
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String editorial = request.getParameter("editorial");
        int r;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3308/biblioteca","root","");
            
            PreparedStatement ps = con.prepareStatement("insert into libro (isbn,titulo,autor,editorial) values (?,?,?,?)");
            ps.setInt(1,Integer. parseInt (isbn));
            ps.setString(2,titulo);
            ps.setString(3,autor);
            ps.setString(4,editorial);
            r = ps.executeUpdate();
            if(r>=1){
                out.println("<h1>Registrado con exito</h1>");
            }else{
                out.println("<h1>No registrado</h1>");
            }
            
        }catch(Exception e){
            out.println("<h2>El ISBN debe de contener máximo 9 carecteres de tipo numerico</h2>");
                    
        }
         
        %>
     
        
    </body>
</html>
