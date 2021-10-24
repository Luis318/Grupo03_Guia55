<%-- 
    Document   : insert.jsp
    Created on : 23/10/2021, 04:03:02 PM
    Author     : kevin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Registro</title>
    </head>
    <body>
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
            out.print(e);
        }
        %>
        <a href="index.jsp" name="regesar" class="btn btn-primary">Regresar al Index</a>
    </body>
</html>
