<%-- 
    Document   : index
    Created on : 23/10/2021, 10:04:23 AM
    Author     : kevin
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ include file="coneccion.jsp" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index Jsp</title>

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
        <br>
        <div class="container">
            <div class="card datos">
                <h5 class="card-header">Formulario de Registro</h5>
                <div class="card-body">
                    <form action="insert.jsp" method="post">

                        <div class="form-group row">
                            <label for="inputIsbn" class="col-sm-2 col-form-label">Isbn</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="isbn" id="isbn" placeholder="Ingrese Isbn" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputTitulo" class="col-sm-2 col-form-label">Titulo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="titulo" id="titulo" placeholder="Ingrese titulo" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputAutor" class="col-sm-2 col-form-label">Autor</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="autor" id="autor" placeholder="Ingrese Autor" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="inputEditorial" class="col-sm-2 col-form-label">Editorial</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="editorial" id="editorial" placeholder="Ingrese editorial" required>
                            </div>
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary" style="float: right">Registrar</button>
                    </form>
                    
                </div>
            </div>

            <div class="card datos2">
                <h5 class="card-header">Libros Registrados</h5>
                <div class="card-body">
                    <!--Tabla de la base-->
                    <sql:query dataSource = "${conection}" var = "result">
                        SELECT * from libro;
                    </sql:query>


                    <table class="table table-dark table-hover">
                        <tr>
                            <th name="id">id</th>
                            <th>Isbn</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Editorial</th>
                            <th>Acciones</th>
                        </tr>
                        <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                                <td id="id" name="id"><c:out value = "${row.Id}"/></td>
                                <td><c:out value = "${row.isbn}"/></td>
                                <td><c:out value = "${row.titulo}"/></td>
                                <td><c:out value = "${row.autor}"/></td>
                                <td><c:out value = "${row.editorial}"/></td>
                                <td> <a type="button"  
                                             class="btn btn-dark btn-editar" 
                                             data-toggle="tooltip" 
                                             data-placement="bottom"
                                             data-id-estudiante="2"
                                             href="frmupdate.jsp?id=${row.Id}"
                                             title="Editar"> <i class="fas fa-edit"></i>  
                                    </a> 
                                    <a type="button" 
                                            class="btn btn-dark btn-eliminar" 
                                            data-toggle="tooltip" 
                                            data-placement="bottom" 
                                            href="delete.jsp?id=${row.Id}"
                                            title="Eliminar"> <i class="fas fa-trash-alt"></i>
                                    </a> </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <!--Guardar un nuevo registro de libro-->
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>
</html>
