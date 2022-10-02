<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/23
  Time: 上午 10:57
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
        String role = (String)session.getAttribute("role");
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else if (role.equals("0")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'admin.jsp'; </script>");
        }
        else {
            String sess_username = (String)session.getAttribute("sess_username");
            String id = request.getParameter("user_id");
            String old_pass = request.getParameter("old_pass");
            String new_pass = request.getParameter("new_pass");
            Connection con = null;
            Statement stmt = null;
            Statement stmt_1 = null;
            ResultSet rs = null;
            ResultSet sa = null;
            try{
                String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                String user = "besta";
                String password = "besta123";
                String driver = "com.mysql.cj.jdbc.Driver";
                Class.forName(driver);
                con = DriverManager.getConnection(url,user,password);
                stmt = con.createStatement();
                stmt_1 = con.createStatement();
                String sql = "SELECT COUNT(*) FROM `user_list` WHERE `password`='"+old_pass+"' AND `user_id` = "+id;
                rs = stmt.executeQuery(sql);
                rs.next();
                if (rs.getString(1).equals("0")) {
                    out.println("<script language=\"javascript\"> alert('舊密碼輸入錯誤');history.go(-1);</script>");
                }
                else{
                    String sql_1 = "UPDATE `user_list` SET `password` = '"+new_pass+"' WHERE `user_id` = "+id ;
                    int i = stmt_1.executeUpdate(sql_1);
                    out.println("<script language=\"javascript\"> alert('修改完成');window.location.href = 'root_user.jsp';</script>");
                }



            }
            catch (Exception ex){
                out.println("Database error");
            }}
%>
<html>
<head>
    <title>更變密碼</title>
</head>
<body>
</body>
</html>
<%
    }
%>