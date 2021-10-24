<%-- 
    Document   : update.jsp
    Created on : 23/10/2021, 06:42:27 PM
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
        <title>Registro Actualizado</title>
    </head>
    <body>

        <%
            String ids = request.getParameter("id");
            String isbn = request.getParameter("isbn");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String editorial = request.getParameter("editorial");

            try {
                Class.forName("org.mariadb.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3308/biblioteca", "root", "");

                PreparedStatement ps = con.prepareStatement("Update libro set isbn=?,titulo=?,autor=?,editorial=? where id=?");
                ps.setString(1,isbn);
                ps.setString(2,titulo);
                ps.setString(3,autor);
                ps.setString(4,editorial);
                ps.setString(5,ids);
                ps.execute();
            }catch(Exception e){
                out.println(e);
            }
        %>
        <h1>El Registro se actualizo con exito</h1>
        <a href="index.jsp" name="regesar" class="btn btn-primary">Regresar al Index</a>
    </body>
</html>
