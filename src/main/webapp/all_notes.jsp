<%@ page import="helper.HibernateFactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: Prince
  Date: 09-04-2024
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="bootstrap.html"%>
    <title>All Notes</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <br>
    <h1>all Notes:</h1>
    <div class="row">
        <div class="col">
        <%
            Session s = HibernateFactoryProvider.getFactory().openSession();
            Query query = s.createQuery("select n from Note n");
            List<Note> listNote = query.list();
            for(Note note: listNote){
        %>
        <div class="card border-primary mt-3">
            <div class="card-header row m-1" style="background-color: #AFC8AD">
                <div class="col-8"><h5><%=note.getTitle()%></h5></div>
                <div class="col-4 text-right"><%=note.getDate()%></div>
            </div>
            <div class="card-body">
                <h5 class="card-title"></h5>
                <p class="card-text"><%=note.getContent()%></p>
                <div class="float-right mr-3">
                    <a href="update.jsp?note_id=<%=note.getId()%>" class="btn btn-primary mr-4">Update</a>
                    <a href="DelServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
        <%
            }
            s.close();
        %>
        </div>
    </div>
</div>
</body>
</html>
