<%--
  Created by IntelliJ IDEA.
  User: andyc
  Date: 2020/7/20
  Time: 下午 04:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("sess_userid") == null)
    {
        out.println("<script language=\"javascript\">window.location.href = 'error.html';</script>");
    }
    else
    {
        String role = (String)session.getAttribute("role");
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
                String sess_username = (String)session.getAttribute("sess_username");
%>
<html>
    <head>
        <title>管理者介面</title>

        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
        <style>
            #div
            {
                height:90px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">嗨,<%=sess_username%>!</h1>
                <p><h3>您可以透過管理者介面來存取、管理本系統。</h3></p>
            </div>
        </div>
        <div id="div"></div>
        <div class="container py-5">
          <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-3">
                    <h2>使用者管理</h2>
                    <p></p>
                    <button type="button" class="btn btn-dark" onclick="location.href='admin_user.jsp'">前往 »</button>
                </div>
                <div class="col-md-3">
                    <h2>銷售資料管理</h2>
                    <p></p>
                    <button type="button" class="btn btn-dark" onclick="location.href='salesdata.jsp'">前往 »</button>
                </div>
                <div class="col-md-3">
                    <h2>經銷商管理</h2>
                    <p></p>
                    <button type="button" class="btn btn-dark" onclick="location.href='distributor_data.jsp'">前往 »</button>
                </div>
                <div class="col-md-3">
                    <h2>產品項目管理</h2>
                    <p></p>
                    <button type="button" class="btn btn-dark" onclick="location.href='item.jsp'">前往 »</button>
                </div>
            </div>
        </div>
        <div id="div"></div>
        <footer class="container py-5">
            <hr>
            <img src="besta.png" width="100" height="100">
        </footer>
    </body>
</html>
<%
    }}
%>