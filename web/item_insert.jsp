<%@ page contentType="text/html;charset=Big5" language="java" %>
<%
    if (session.getAttribute("sess_userid") == null)
    {
        out.println("<script language=\"javascript\">window.location.href = 'error.html';</script>");
    }
    else
    {
        String role = (String)session.getAttribute("role");
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('�A�L�v���ާ@'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
%>
<html>
    <style>
        #sale_phone1{display:none;}
    </style>
    <head>
        <title>��s�ӫ~���</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">�L�Ĭ�ުѥ��������q</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="location.href='admin.jsp'">����<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('�z�T�w�n�n�X��?')) return true;else return false"><a href="logout.jsp" style="color:white;">�n�X</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>
        <div style="text-align:center" class="container py-5"><h2><strong>�s�W���</strong></h2></div>
        <form method="post" action="item_insert_process.jsp" class="add-item" name="form1">
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="bday">�ӫ~�W��</label>
                        <input type="text"  class="form-control" name="items_name" id="bday" placeholder="�п�J�ӫ~�W��"  required />
                    </div>
                </div>
            </div>

            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div>
                        <input type="submit" class="btn btn-success" value="�e�X" onclick="if(confirm('�z�T�w�e�X��?')) return true;else return false">
                    </div>
                    <div class="col-md-1"></div>
                    <div>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='item.jsp'">�W�@��</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
<%}}%>