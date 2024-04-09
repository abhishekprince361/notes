<!doctype html>
<html>
<head>
    <%@include file="bootstrap.html"%>
    <title>Add New Notes</title>
</head>
<body>
<div class="container">
    <%@include file="header.html"%>
    <br>
    <form action="addnote" method="post">
        <fieldset>
            <legend>Fill Note's Details Here...</legend>

            <div class="form-group">
                <label for="title"> Title </label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter your Note's Title" required>
            </div>

            <div class="form-group">
                <label for="noteContent">Note</label>
                <textarea style="height: 250px;" id="noteContent" class="form-control" name="content" placeholder="Enter Your Content" required></textarea>
            </div>
            <div class="container text-center">
                <button type="submit" class="btn btn-success">Add Note</button>
            </div>
        </fieldset>
    </form>
</div>

</body>
</html>