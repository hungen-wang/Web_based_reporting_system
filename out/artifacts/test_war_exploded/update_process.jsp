<%@ page language="java" contentType="text/html; charset=Big5"%>
<%@ page import="java.sql.*" %>
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
String user_name=new String(request.getParameter("user_name").getBytes("8859_1"));
String client_name=new String(request.getParameter("client_name").getBytes("8859_1"));
String client_contact=new String(request.getParameter("client_contact").getBytes("8859_1"));
String client_phone=new String(request.getParameter("client_phone").getBytes("8859_1"));
String face_num=new String(request.getParameter("face_num").getBytes("8859_1"));
String hot_num=new String(request.getParameter("hot_num").getBytes("8859_1"));
String ps=new String(request.getParameter("ps").getBytes("8859_1"));

%>
<%
    String db_user="besta";
    String db_pwd="besta123";
    String driver="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url,db_user,db_pwd);

    if(user_name != null)
    {
        Connection con = null;
        PreparedStatement pss = null;
        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url,db_user,db_pwd);
            String sql="Update testdata set client_contact=?,client_phone=?,face_num=?,hot_num=?,ps=? where client_name='"+client_name+"'";
            pss = con.prepareStatement(sql);
            pss.setString(1, client_contact);
            pss.setString(2, client_phone);
            pss.setString(3, face_num);
            pss.setString(4, hot_num);
            pss.setString(5, ps);
            int i = pss.executeUpdate();
            if(i > 0)
            {
                //out.print("Record Updated Successfully");
                out.print("<script>alert('修改成功'); window.location='search.jsp' </script>");
            }
            else
            {
                out.print("資料有誤，請重新修改");
            }
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
    }}
%>