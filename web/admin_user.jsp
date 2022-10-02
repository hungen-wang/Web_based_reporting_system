<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/21
  Time: 上午 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
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
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try{
                String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                String user = "besta";
                String password = "besta123";
                String driver = "com.mysql.cj.jdbc.Driver";
                Class.forName(driver);
                con = DriverManager.getConnection(url,user,password);
                stmt = con.createStatement();
                String sql = "SELECT `user_name`,`account`,`role`,`sale_name`,`phone`,`email`,`ban` ,`user_id`FROM `user_list`,`sale_list` WHERE user_list.sale_id=sale_list.sale_id AND `role`!=\"超級使用者\"";
                rs = stmt.executeQuery(sql);
            }
            catch (Exception ex){
                out.println("fail");
            }
%>
<html>
    <head>
        <title>使用者管理</title>
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
                    <button type="button" class="btn btn-info" onclick="location.href='admin_add.jsp'">新增資料<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h2><strong>使用者清單</strong></h2></div>

        <table id="contentTable" class="table table-bordered table-striped text-center table-hover table-condensed" style="font-size:20px; width:100%">
            <thead>
                <tr>
                    <td style="width:11%;">姓名</td>
                    <td style="width:11%;">使用者帳號</td>
                    <td style="width:11%;">權限</td>
                    <td style="width:11%;">經銷商</td>
                    <td style="width:11%;">聯絡電話</td>
                    <td style="width:11%;">電子郵件</td>
                    <td style="width:11%;">禁用</td>
                    <td style="width:11%;">修改</td>
                    <td style="width:11%;">刪除</td>
                </tr>
            </thead>
            <%
                while (rs.next()){
            %>
            <tr>
                <td align="center"><%=rs.getString(1)%></td>
                <td align="center"><%=rs.getString(2)%></td>
                <td align="center"><%=rs.getString(3)%></td>
                <td align="center"><%=rs.getString(4)%></td>
                <td align="center"><%=rs.getString(5)%></td>
                <td align="center"><%=rs.getString(6)%></td>
                <td align="center"><%Integer i = rs.getInt(7);
                    if (i==0){out.println(" ");}
                    else {out.println("v");}
                %></td>
                <td align="center"><a href="admin_update.jsp?id=<%=rs.getString(8)%>">修改</a></td>
                <td align="center"><%
                    if (rs.getString(3).equals("標準使用者")){out.print("<a href=\"admin_delete.jsp?id="+rs.getString(8)+"\">刪除</a>");}
                %>
                </td>

            </tr>
            <%
                }
                    rs.close();
                    stmt.close();
                }}
            %>
        </table>

        <div class="row justify-content-center align-items-center py-3">
            <div col order-2>
                <button type="button" class="btn btn-outline-dark" onclick="location.href='admin_user.jsp'">置頂</button>
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
