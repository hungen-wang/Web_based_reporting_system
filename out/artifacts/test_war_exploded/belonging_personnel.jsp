<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/27
  Time: 上午 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*"%>

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
    String driver = "com.mysql.jdbc.Driver";
    String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
    String userid = "besta";
    String password = "besta123";
    try
    {
        Class.forName(driver);
    }
    catch (ClassNotFoundException e)
    {
        e.printStackTrace();
    }
    Connection connection = null;

%>
<%
    try{
        connection = DriverManager.getConnection(url, userid, password);




%>
<html>
    <head>
        <title>所屬人員資料</title>
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
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h3><strong>經銷商所屬人員列表檢視</strong></h3></div>
        <%
            String sale_name = request.getParameter("sale_name");
                ResultSet mv = null;
                Statement stmt2 = connection.createStatement();
                String sql2="SELECT * FROM sale_list natural join sale_manage where sale_name ='"+sale_name+"'";
                mv = stmt2.executeQuery(sql2);
                int NUM = 1;

        %>
            <h3 align="center"><strong><%=sale_name%></strong></h3>
            <table id="contentTable" class="table table-bordered table-striped text-center table table-hover table-condensed" style="font-size:20px;">
                <thead>
                    <tr>
                        <th style="width:200px;">業務編號</th>
                        <th style="width:200px;">經銷商聯絡人</th>
                        <th style="width:200px;">聯絡人電話</th>
                    </tr>
                </thead>
                <%
                        while(mv.next())
                        {
                        %>
                <tr>
                    <td align="center"><%=NUM%></td>
                    <td align="center"><%=mv.getString("sale_contact")%></td>
                    <td align="center"><%=mv.getString("sale_phone")%></td>
                </tr>
        <%
                NUM++;
                    }


                connection.close();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            }}
        %>
            </table>
                <footer class="container py-5">
                    <hr>
                    <div class="row justify-content-center align-items-center">
                        <div>
                            <button type="button" class="btn btn-outline-dark" onclick="location.href='distributor_data.jsp'">上一頁</button>
                        </div>
                    </div>
                </footer>
    </body>
</html>