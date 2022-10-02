<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/21
  Time: 下午 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        else if (role.equals("0")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'admin.jsp'; </script>");
        }
        else {
            String sess_username = (String)session.getAttribute("sess_username");
    if(request.getParameterMap().containsKey("id"))
    {
        String id = request.getParameter("id");
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String user = "besta";
            String password = "besta123";
            String driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            stmt = con.createStatement();
            String sql = "DELETE FROM `user_list` WHERE `user_list`.`user_id` =" + id;
            int i = stmt.executeUpdate(sql);
            String site = new String("root_user.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        } catch (Exception ex) {
            out.println("fail");
        }
    }
    else {
        out.print("<script language=\"javascript\">alert('無效操作\\n請重試');window.location.href = 'root_user.jsp';</script>");
    }}}
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
