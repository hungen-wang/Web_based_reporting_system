<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/16
  Time: 上午 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String user = "root";
        String password = "12345678";
        String driver = "com.mysql.cj.jdbc.Driver";
        Class.forName(driver);
        con = DriverManager.getConnection(url,user,password);
        stmt = con.createStatement();
        String sql = "INSERT INTO `user_list` (`user_id`, `user_name`, `role`, `sale_id`, `phone`, `email`, `account`, `password`, `ban`) VALUES ('5', '你看', '標準使用者', '0', '0946511322', 'kjdvhsdkjvh@gmail.com', 'admin', 'admin123', '0');  ";
        int i = stmt.executeUpdate(sql);
        out.println("success");
        }
    catch (Exception ex)
    {
        out.println("fail");
    }
%>
<html>
<head>
    <title>SQL_JSP_test</title>
</head>
<body>

</body>
</html>
