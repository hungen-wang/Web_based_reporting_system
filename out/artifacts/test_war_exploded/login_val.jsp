<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/20
  Time: 下午 03:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%

    if ("POST".equalsIgnoreCase(request.getMethod())) {
            String account = new String((request.getParameter("account")).getBytes("ISO-8859-1"),"UTF-8");
            String po_passwd = new String((request.getParameter("password")).getBytes("ISO-8859-1"),"UTF-8");
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

                String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                String user = "besta";
                String password = "besta123";
                String driver = "com.mysql.cj.jdbc.Driver";
                Class.forName(driver);
                con = DriverManager.getConnection(url,user,password);
                stmt = con.createStatement();
                String sql = "SELECT COUNT(account) FROM `user_list` WHERE `account`=\"" +account+"\" AND `password`=\""+po_passwd+"\"AND `ban`=0";
                rs = stmt.executeQuery(sql);

%>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%
    rs.next();
    int val = rs.getInt(1);
    if (val == 0) {
        out.println("<script language=\"javascript\">alert('無效操作\\n請重試');window.location.href = 'login.html';</script>");
        rs.close();
    }
    if (val == 1) {
        rs.close();
        String sql_1 = "SELECT * FROM `user_list` WHERE `account`=\"" + account + "\" AND `password`=\"" + po_passwd + "\"";
        rs = stmt.executeQuery(sql_1);
        rs.next();
        Integer user_id = rs.getInt("user_id");
        String username = rs.getString("user_name");
        Integer sale_id = rs.getInt("sale_id");
        String role = rs.getString("role");
        if (role.equals("超級使用者"))
        {
            session.setAttribute("sess_userid", user_id);
            session.setAttribute("sess_username", username);
            session.setAttribute("role","2");
            out.println("<script language=\"javascript\">alert('歡迎您" + username + "');window.location.href = 'root.jsp';</script>");
        }
        else if (role.equals("系統管理員"))
        {
            session.setAttribute("sess_userid", user_id);
            session.setAttribute("sess_username", username);
            session.setAttribute("role","0");
            out.println("<script language=\"javascript\">alert('歡迎您" + username + "');window.location.href = 'admin.jsp';</script>");
        }
        else
        {
            session.setAttribute("sess_userid", user_id);
            session.setAttribute("sess_username", username);
            session.setAttribute("sess_saleid",sale_id);
            session.setAttribute("role","1");
            out.println("<script language=\"javascript\">alert('歡迎您" + username +"');window.location.href = 'search.jsp';</script>");
        }
    }
    rs.close();
    con.close();
    }
    else {
        out.println("<script language=\"javascript\">alert('請先登入');window.location.href = 'login.html';</script>");
    }
%>

</body>
</html>
