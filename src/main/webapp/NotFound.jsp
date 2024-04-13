<%--
  Created by IntelliJ IDEA.
  User: Prince
  Date: 13-04-2024
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="bootstrap.html"%>
    <title>Search Not Found</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <%
        String title = (String) request.getAttribute("title");
    %>
    <br>
    <h1 class="text-center">Search Result:</h1>
    <div class="row">
        <div class="col">
            <div class="card border-primary mt-3">
                <div class="card-header row m-1" style="background-color: #AFC8AD">
                    <div class="col-8"><h5> " <%= title %> ", Not Found...</h5></div>
                </div>
                <div class="card-body">
                    <h5 class="card-title"></h5>
                    <p class="card-text"></p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
