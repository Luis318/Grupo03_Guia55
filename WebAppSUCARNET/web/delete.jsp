<%-- 
    Document   : delete.jsp
    Created on : 23/10/2021, 06:57:50 PM
    Author     : kevin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Eliminacion Registro</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        
    </head>

    <body>
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
        </style>

        <%
            String ids = request.getParameter("id");
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3308/biblioteca", "root", "");

                PreparedStatement ps = con.prepareStatement("Select * from libro where id=?");
                ps.setString(1, ids);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String id = rs.getString(1);
                    String isbn = rs.getString(2);
                    String titulo = rs.getString(3);
                    String autor = rs.getString(4);
                    String editorial = rs.getString(5);

        %>

        <br>

        <div class="container">
            <div class="card datos">
                <div class="card-header">
                    <h4>Se elimino el siguiente registro</h4>
                </div>
                <div class="card-body">
                    <form action="update.jsp?id=<%=id%>" method="post">

                        <div class="form-group row">
                            <label for="inputIsbn" class="col-sm-2 col-form-label">Id</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="id" id="id" value="<%=id%>" disabled="true">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputIsbn" class="col-sm-2 col-form-label">Isbn</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="isbn" id="isbn" value="<%=isbn%>" disabled="true">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputTitulo" class="col-sm-2 col-form-label">Titulo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="titulo" id="titulo" value="<%=titulo%>" disabled="true">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputAutor" class="col-sm-2 col-form-label">Autor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="autor" id="autor" value="<%=autor%>" disabled="true">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEditorial" class="col-sm-2 col-form-label">Editorial</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="editorial" id="editorial" value="<%=editorial%>" disabled="true">
                            </div>
                        </div>
                       <a href="index.jsp" name="regesar" class="btn btn-primary">Regresar al Index</a>
                    </form>  
                </div>
            </div>
        </div>

        <%     }

        %>

        <%    } catch (Exception e) {
                out.print(e);
            }
        %>
        <%

            try {
                String id = request.getParameter("id");
                Class.forName("org.mariadb.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3308/biblioteca", "root", "");

                PreparedStatement ps = con.prepareStatement("Delete from libro where id=?");
                ps.setString(1,id);
                ps.execute();

            } catch (Exception e) {
                out.println(e);
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>
</html>


