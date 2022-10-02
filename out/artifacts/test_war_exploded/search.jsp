<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    if (session.getAttribute("sess_userid") == null)
    {
        out.println("<script language=\"javascript\">window.location.href = 'error.html';</script>");
    }
    else
    {
        String role = (String)session.getAttribute("role");
        if (role.equals("0")){
            out.println("<script language=\"javascript\">window.location.href = 'admin.jsp'; </script>");
        }
        else {
            //String sale_id = request.getParameter("sale_id");
            Integer sess_sale = (Integer) session.getAttribute("sess_saleid");
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
                    <button type="button" class="btn btn-info" onclick="location.href='salepage.jsp'">新增資料</button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-warning" onclick="location.href='repair.jsp'">報修</button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>
        <div style="text-align:center" class="container py-5"><h3><strong>查詢名單</strong></h3></div>

        <table id="contentTable" class="table table-bordered table-striped text-center table-hover table-condensed" style="font-size:20px; width:100%">
            <thead>
                <tr>
                    <th style="width:9%;">報備人員</th>
                    <th style="width:9%;">客戶名稱</th>
                    <th style="width:9%;">客戶聯絡人</th>
                    <th style="width:9%;">客戶聯絡人電話</th>
                    <th style="width:9%;">經銷商名稱</th>
                    <th style="width:9%;">經銷商聯絡人</th>
                    <th style="width:11%;">經銷商聯絡人員電話</th>
                    <th style="width:9%;">人臉辨識機數量</th>
                    <th style="width:10%;">熱成像辨識機數量</th>
                    <th style="width:9%;">備註</th>
                    <th style="width:5%;">編輯</th>
                </tr>
            </thead>
            <%

                try{
                    connection = DriverManager.getConnection(url,db_user,db_pwd);
                    statement=connection.createStatement();
                    String sql ="select * from testdata natural join sale_list where sale_id = + '"+sess_sale+"'";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
            %>
            <tr>
                <td><%=resultSet.getString("user_name") %></td>
                <td><%=resultSet.getString("client_name") %></td>
                <td><%=resultSet.getString("client_contact") %></td>
                <td><%=resultSet.getString("client_phone") %></td>
                <td><%=resultSet.getString("sale_name") %></td>
                <td><%=resultSet.getString("sale_contact") %></td>
                <td><%=resultSet.getString("sale_phone") %></td>
                <td><%=resultSet.getString("face_num") %></td>
                <td><%=resultSet.getString("hot_num") %></td>
                <td><%=resultSet.getString("ps") %></td>
                <td><a href="update.jsp?client_name=<%=resultSet.getString("client_name")%>">修改</a></td>
            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                }}
            %>
        </table>
        <div class="row justify-content-center align-items-center py-3">
            <div col order-2>
                <button type="button" class="btn btn-outline-dark" onclick="location.href='search.jsp'">置頂</button>
            </div>
        </div>
        <footer class="container py-3">
            <hr>
            <img src="besta.png" width="100" height="100">
        </footer>
    </body>
</html>
