<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/22
  Time: 下午 02:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=Big5"%>
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
    String client_name = new String(request.getParameter("client_name").getBytes("8859_1"));
    String driver = "com.mysql.jdbc.Driver";
    String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
    String userid = "besta";
    String password = "besta123";
%>
<%
    String sale_name =new String(request.getParameter("sale_name").getBytes("8859_1"));
    String date =new String(request.getParameter("date").getBytes("8859_1"));
    String face_num=new String(request.getParameter("face_num").getBytes("8859_1"));
    String hot_num=new String(request.getParameter("hot_num").getBytes("8859_1"));
    String state =new String(request.getParameter("state").getBytes("8859_1"));
    String client_contact =new String(request.getParameter("client_contact").getBytes("8859_1"));
    String client_phone =new String(request.getParameter("client_phone").getBytes("8859_1"));
    String sale_contact =new String(request.getParameter("sale_contact").getBytes("8859_1"));
    String sale_phone =new String(request.getParameter("sale_phone").getBytes("8859_1"));

    if(client_name != null)
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url,userid,password);

        ResultSet sm = null;
        Statement stmt = con.createStatement();
        String sql1="SELECT * FROM sale_list where sale_name ='"+sale_name+"'";
        sm = stmt.executeQuery(sql1);
        sm.next();
        String SALE_ID =sm.getString("sale_id");
        PreparedStatement ps = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, password);

                String sql = "Update sale_data set sale_id=?,date=?,face_num=?,hot_num=?,state=?,client_contact=?,client_phone=?,sale_contact=?,sale_phone=?  where client_name='" + client_name + "'";
                ps = con.prepareStatement(sql);
                ps.setString(1, SALE_ID);
                ps.setString(2, date);
                ps.setString(3, face_num);
                ps.setString(4, hot_num);
                ps.setString(5, state);
                ps.setString(6, client_contact);
                ps.setString(7, client_phone);
                ps.setString(8, sale_contact);
                ps.setString(9, sale_phone);

            int i = ps.executeUpdate();
            if (i > 0)
            {

                out.print("<script>alert('更新成功囉!'); window.location='salesdata.jsp' </script>");
            }
            else
                {
                out.print("There is a problem in updating Record.");
            }
        }
        catch (SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
    }}
%>
