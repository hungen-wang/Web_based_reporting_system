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
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
    String Id=new String(request.getParameter("Id").getBytes("8859_1"));
    String sale_name=new String(request.getParameter("sale_name").getBytes("8859_1"));
    String sale_contact=new String(request.getParameter("sale_contact").getBytes("8859_1"));
    String sale_phone=new String(request.getParameter("sale_phone").getBytes("8859_1"));
    String banned=new String(request.getParameter("banned").getBytes("8859_1"));
    String hot_check=new String(request.getParameter("hot_check").getBytes("8859_1"));
    String face_check = new String(request.getParameter("face_check").getBytes("8859_1"));

%>

<%
    String db_user="besta";
    String db_pwd="besta123";
    String driver="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url,db_user,db_pwd);
    Statement st = null;
    ResultSet rs = null;
    if(Id != null)
    {
        Connection con = null;
        PreparedStatement pss = null;
        try
        {

            Class.forName(driver);
            con = DriverManager.getConnection(url,db_user,db_pwd);
            String sql="Update sale_manage natural join sale_list set sale_name=?,sale_contact=?,sale_phone=?,banned=? ,face_check=?,hot_check=? where Id='"+Id+"'";
            pss = con.prepareStatement(sql);
            pss.setString(1, sale_name);
            pss.setString(2, sale_contact);
            pss.setString(3, sale_phone);
            pss.setString(4, banned);
            pss.setString(5, face_check);
            pss.setString(6, hot_check);

            int i = pss.executeUpdate();
            if(i > 0)
            {
                out.print("<script>alert('修改成功'); window.location='distributor_data.jsp' </script>");
            }
            else
            {
                out.print("There is a problem in updating Record.");
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