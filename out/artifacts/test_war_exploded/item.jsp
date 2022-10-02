<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
            String db_user="besta";
            String db_pwd="besta123";
            String driver="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
%>

<html>
    <head>
        <title>search</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
        <style type="text/css">
            #contentTable
            {
                table-layout:fixed; /* bootstrap-table設定colmuns中某列的寬度無效時，需要給整個表設定css屬性 */
                word-break:break-all; word-wrap:break-all; /* 自動換行 */
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-info" onclick="location.href='item_insert.jsp'">新增資料</button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>
        <div style="text-align:center" class="container py-5"><h3><strong>無敵科技股份有限公司</strong></h3></div>

        <table id="contentTable" class="table table-bordered table-striped text-center table-hover table-condensed" style="font-size:20px; width:100%">
            <thead>
            <tr>
                <th style="width:50%;">物品項物名稱</th>
                <th style="width:50%;">編輯</th>
            </tr>
            </thead>
            <%

                try{
                    connection = DriverManager.getConnection(url,db_user,db_pwd);
                    statement=connection.createStatement();
                    String sql ="select * from items ";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
            %>
            <tr>
                <td><%=resultSet.getString("items_name") %></td>

                <td><a href="item_delete.jsp?items_id=<%=resultSet.getString("items_id")%>">刪除</a></td>
            </tr>
            <%
                            }
                            connection.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                    }

            %>
        </table>
        <div class="row justify-content-center align-items-center py-3">
            <div col order-2>
                <button type="button" class="btn btn-outline-dark" onclick="location.href='item.jsp'">置頂</button>
            </div>
            <div class="col-md-1"></div>
            <div col order-1>
                <button type="button" class="btn btn-outline-dark" onclick="location.href='admin.jsp'">上一頁</button>
            </div>
        </div>
        <footer class="container py-3">
            <hr>
            <img src="besta.png" width="100" height="100">
        </footer>
    </body>
</html>
