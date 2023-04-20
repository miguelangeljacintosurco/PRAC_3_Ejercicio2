<%-- 
    Document   : index
    Created on : 4 abr. 2023, 0:40:22
    Author     : CRISTHIAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.practica_3_2.Registro"%>
<%
    if(session.getAttribute("listaper") == null){
        ArrayList<Registro> lisaux = new ArrayList<Registro>();
        session.setAttribute("listaper",lisaux);
    }
    ArrayList<Registro> lista = (ArrayList<Registro>) session.getAttribute("listaper");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Gestor de Tareas</h1>
        <h2>Univ. Cristhian Pedro Mendoza Marca</h2>
        <a href="MainServlet?op=nuevo">Nuevo</a>
        <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Tarea</th>
                    <th>Completado</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if (lista != null){
                        for(Registro item: lista){                       
                %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getTarea() %></td>
                    <td><% if(item.getCheck().equals("si")){%>
                    <input type="checkbox" name="check" checked=""/>
                    <%
                    }else{%>
                    <input type="checkbox" name="check"/>
                    <%
                    }  %> </td>
                    <td> 
                        <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                    </td>
                    <td> 
                        <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                           onclick="return(confirm('Esta seguro de Eliminar??'))"
                           >Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
        </table>

        
    </body>
</html>
