<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/21
  Time: 上午 11:34
  To change this template use File | Settings | File Templates.
--%>
<%--@ page import="com.mysql.jdbc.Driver" --%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=Big5" language="java" %>
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
    String sale_name =new String(request.getParameter("sale_name").getBytes("8859_1"));
    String sale_contact =new String(request.getParameter("sale_contact").getBytes("8859_1"));
    String sale_phone =new String(request.getParameter("sale_phone").getBytes("8859_1"));
    String banned =new String(request.getParameter("banned").getBytes("8859_1"));
    String face_check =new String(request.getParameter("face_check").getBytes("8859_1"));
    String hot_check =new String(request.getParameter("hot_check").getBytes("8859_1"));


%>
<%

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
            ResultSet rs = null;
            ResultSet sm = null;
            ResultSet mv = null;
            try
            {
//建立statement
                Statement stmt = conn.createStatement();
                Statement stmt1 = conn.createStatement();
                Statement stmt2 = conn.createStatement();

                String sql = "SELECT MAX(sale_id) FROM sale_list ";
                rs = stmt.executeQuery(sql);
                rs.next();
                Integer sale_id = rs.getInt(1)+1;

                String sql1="SELECT * FROM sale_list where sale_name ='"+sale_name+"'";
                sm = stmt1.executeQuery(sql1);
                sm.next();
                Integer num = sm.getRow();

                String sql2 = "SELECT MAX(Id) FROM sale_manage ";
                mv = stmt2.executeQuery(sql2);
                mv.next();
                Integer Id = mv.getInt(1)+1;

                try
                {

                    if(num<1)
                    {
//建立SQL查詢
                        int j = stmt1.executeUpdate("insert into sale_list(sale_id,sale_name)values('" + sale_id + "','" + sale_name + "')");


                        int i = stmt.executeUpdate("insert into sale_manage(Id,sale_id,sale_contact,sale_phone,banned,face_check,hot_check)values" +
                                "('" + Id + "','" +  sale_id+ "','" + sale_contact + "','" + sale_phone + "','" + banned + "','" + face_check + "','" + hot_check + "')");
                    }
                    else
                    {
                        String oldsale = sm.getString("sale_id");
                        int i = stmt2.executeUpdate("insert into sale_manage(Id,sale_id,sale_contact,sale_phone,banned,face_check,hot_check)values" +
                                "('" + Id + "','" +  oldsale+ "','" + sale_contact + "','" + sale_phone + "','" + banned + "','" + face_check + "','" + hot_check + "')");
                    }

                    out.print("<script>alert('新增成功'); window.location='distributor_data.jsp' </script>");


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



