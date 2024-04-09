<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="bootstrap.html"%>
    <title>Notes</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <br>
    <div class="card border-none pt-5 pb-2" style="background-color: #AAD9BB">
        <img class="img-fluid mx-auto" style="max-width: 450px" src="image/note.png" alt="image Not found">
        <h1 class="text-primary text-center">Note Application</h1>
        <div class="row text-center mt-3 mb-2">
            <div class="col-6">
                <button onclick="document.location.href='addNotes.jsp';" class="btn btn-primary">New</button>
            </div>
            <div class="col-6">
                <button onclick="document.location.href='all_notes.jsp';" class="btn btn-success">Notes</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>