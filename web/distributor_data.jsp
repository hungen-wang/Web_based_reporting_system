<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/13
  Time: 下午 04:38
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
    try
    {
//讀取mysqlDriver驅動程式
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        try
        {
//連接mysql資料庫
// 資料庫名稱"abcd",帳號"root",密碼"A8880427",
// 使用Unicode編碼"true",字元集"UTF-8"
            String db_user="besta";
            String db_pwd="besta123";
            String driverName="com.mysql.jdbc.Driver";
            String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
            Class.forName(driverName);
            Connection conn= DriverManager.getConnection(url,db_user,db_pwd);


            try
            {
//建立statement
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                try
                {
//建立SQL查詢
                    String sql="select * from sale_manage natural join sale_list";
                    ResultSet rs = stmt.executeQuery(sql);


%>
<html>
    <head>
        <title>經銷商管理</title>
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
                    <button type="button" class="btn btn-info" onclick="location.href='distributor_insert.jsp'">新增資料<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h3><strong>銷售資料清單</strong></h3></div>

        <table id="contentTable" class="table table-bordered table-striped text-center table-hover table-condensed" style="font-size:20px; width:100%">
            <thead>
                <tr>
                    <th style="width:12%;">經銷商名稱</th>
                    <th style="width:12%;">經銷商聯絡人</th>
                    <th style="width:12%;">經銷商聯絡電話</th>
                    <th style="width:12%;">是否禁用</th>
                    <th style="width:12%;">是否可銷售人臉辨識機</th>
                    <th style="width:13%;">是否可銷售熱成像測溫機</th>
                    <th style="width:12%;">編輯</th>
                    <th style="width:12%;">所屬人員列表檢視</th>
                </tr>
            </thead>
            <%
                //顯示資料
                while(rs.next())
                {
            %>
                <tr>
                <td align="center"><%=rs.getString("sale_name")%></td>
                <td align="center"><%=rs.getString("sale_contact")%></td>
                <td align="center"><%=rs.getString("sale_phone")%></td>
                    <td align="center"><%=rs.getString("banned")%></td>

                <%
                    String face =rs.getString("face_check");
                    if (face.equals("不行"))
                {
                %>
                 <td align="center">X</td>
                <%
                }
                    else
                    {
                %>
                    <td align="center">V</td>
                <%
                    }
                %>
                    <%
                        String hot =rs.getString("hot_check");
                        if (hot.equals("不行"))
                        {
                    %>
                    <td align="center">X</td>
                    <%
                    }
                    else
                    {
                    %>
                    <td align="center">V</td>
                    <%
                        }
                    %>

                <td align="center"><a href="distributor_update.jsp?Id=<%=rs.getString("Id")%>">修改</a></td>
                    <td align="center"><a href="belonging_personnel.jsp?sale_name=<%=rs.getString("sale_name")%>">檢視</a></td>
                </tr>
            <%
                }
            %>
        </table>

        <div class="row justify-content-center align-items-center py-3">
            <div col order-2>
                <button type="button" class="btn btn-outline-dark" onclick="location.href='distributor_data.jsp'">置頂</button>
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
<%
                    // 關閉連線
                    rs.close();
                    rs = null;
                    stmt.close();
                    stmt = null;
                    conn.close();
                }
                catch (Exception ex)
                {
                    out.println("can't read data");
                    out.println(ex.toString());
                }
            }
            catch (Exception e)
            {
                out.println("can't create statement");
                out.println(e.toString());
            }
        }
        catch(Exception e)
        {
            out.println("can't content mysql database");
            out.println(e.toString());
        }

    }
    catch(Exception e)
    {
        out.println("can't load mysql driver");
        out.println(e.toString());
    }
    }}
%>
