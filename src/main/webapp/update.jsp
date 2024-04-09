<%@ page import="org.hibernate.Session" %>
<%@ page import="helper.HibernateFactoryProvider" %>
<%@ page import="entity.Note" %><%--
  Created by IntelliJ IDEA.
  User: Prince
  Date: 09-04-2024
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Notes</title>
    <%@include file="bootstrap.html"%>
    <title>All Notes</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <div class="text-center">Update your Note</div>
    <%
        int id = Integer.parseInt(request.getParameter("note_id").trim());
        Session s = HibernateFactoryProvider.getFactory().openSession();
        Note note = (Note)s.get(Note.class, id);
        s.close();
    %>
    <form action="updateNote" method="post">
        <fieldset>
            <legend>Update Note...</legend>

            <input value="<%=note.getId()%>" name="id" type="hidden">

            <div class="form-group">
                <label for="title"> Title </label>
                <input value="<%=note.getTitle()%>" type="text" class="form-control" id="title" name="title" placeholder="Enter your Note's Title" required>
            </div>

            <div class="form-group">
                <label for="noteContent">Note</label>
                <textarea style="height: 250px" id="noteContent" class="form-control" name="content" placeholder="Enter Your Content" required><%=note.getContent()%>
                </textarea>
            </div>
            <div class="container text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
