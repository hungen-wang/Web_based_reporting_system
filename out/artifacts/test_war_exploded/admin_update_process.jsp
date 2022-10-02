<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/21
  Time: 下午 01:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("sess_userid") == null)
    {
        out.println("<script language=\"javascript\">window.location.href = 'error.html';</script>");
    }
    else
    {
        String sess_role = (String)session.getAttribute("role");
        if (sess_role.equals("1")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
        String user_id = new String((request.getParameter("user_id")).getBytes("ISO-8859-1"), "UTF-8");
        String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"), "UTF-8");
        String account = new String((request.getParameter("account")).getBytes("ISO-8859-1"), "UTF-8");
        String role = new String((request.getParameter("role")).getBytes("ISO-8859-1"), "UTF-8");
        String phone = new String((request.getParameter("phone")).getBytes("ISO-8859-1"), "UTF-8");
        String email = new String((request.getParameter("email")).getBytes("ISO-8859-1"), "UTF-8");
        String ban = new String((request.getParameter("ban")).getBytes("ISO-8859-1"), "UTF-8");
        String sale_id = new String((request.getParameter("sale_id")).getBytes("ISO-8859-1"), "UTF-8");

        Connection con = null;
        Statement stmt = null;
        try
        {
            String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user = "besta";
            String db_password = "besta123";
            String driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, db_password);
            stmt = con.createStatement();
            String sql = "UPDATE `user_list` SET `user_name` = '" + name + "', `role` = '" + role + "', `sale_id` = '" + sale_id + "', `phone`='" + phone + "',`email` = '" + email + "', `account` = '" + account + "', `ban` = '" + ban + "' WHERE `user_list`.`user_id` = " + user_id;
            int i = stmt.executeUpdate(sql);
            out.println("<script language=\"javascript\"> alert('修改完成');window.location.href = 'admin_user.jsp';</script>");
        }
        catch (Exception ex)
        {
            out.println("<script language=\"javascript\"> alert('修改錯誤');window.history.go(-1); ;</script>");
        }
    }}
%>
<html>
<head>
    <title>修改使用者</title>
</head>
</html>