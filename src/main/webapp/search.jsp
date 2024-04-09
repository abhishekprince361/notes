<%@ page import="org.hibernate.Session" %>
<%@ page import="helper.HibernateFactoryProvider" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="entity.Note" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Prince
  Date: 10-04-2024
  Time: 00:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="bootstrap.html"%>
    <title>Search Result</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <br>
    <h1 class="text-center">Search Result:</h1>
    <div class="row">
        <div class="col">
            <%
                String title1 = request.getParameter("title");
                Session s = HibernateFactoryProvider.getFactory().openSession();
                Query query = s.createQuery("select n from Note n where n.title=?1");
                query.setParameter(1, title1);
                List<Note> listNote = query.list();
                for(Note note: listNote){
                    if(note!=null){
                        %>
                        <div class="card border-primary mt-3">
                            <div class="card-header row m-1" style="background-color: #AFC8AD">
                                <div class="col-8"><h5><%=note.getTitle()%></h5></div>
                                <div class="col-4 text-right"><%=note.getDate()%></div>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <p class="card-text"><%=note.getContent()%></p>
                            </div>
                        </div>
                        <%
                    } else { %>
            <h2>Not found</h2><%
                    }
                            }
                s.close();
             %>
        </div>
    </div>
</div>
</body>
</html>