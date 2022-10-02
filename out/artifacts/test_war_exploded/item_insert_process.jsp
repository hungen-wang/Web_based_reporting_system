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
            String items_name =new String(request.getParameter("items_name").getBytes("8859_1"));



%>
<%

            try
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                try
                {

                    String db_user="besta";
                    String db_pwd="besta123";
                    String driverName="com.mysql.jdbc.Driver";
                    String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
                    Class.forName(driverName);
                    Connection conn= DriverManager.getConnection(url,db_user,db_pwd);
                    ResultSet rs = null;
                    ResultSet sm = null;
                    try
                    {

                        Statement stmt = conn.createStatement();
                        Statement stmt1 = conn.createStatement();

                        String sql = "SELECT MAX(items_id) FROM items ";
                        rs = stmt.executeQuery(sql);
                        rs.next();
                        Integer items_id = rs.getInt(1)+1;

                        String sql1="SELECT * FROM items where items_name ='"+items_name+"'";
                        sm = stmt1.executeQuery(sql1);
                        sm.next();
                        Integer num = sm.getRow();

                        try
                        {

                            if(num<1)
                            {

                                int i = stmt1.executeUpdate("insert into items(items_id,items_name)values('" + items_id + "','" + items_name + "')");

                            }
                            else
                            {
                                String olditem = sm.getString("items_id");
                                int i = stmt1.executeUpdate("insert into items(items_id,items_name)values('" + olditem + "','" + items_name + "')");
                            }

                            out.print("<script>alert('新增成功'); window.location='item.jsp' </script>");

                        }
                        catch (Exception ex)
                        {
                            out.println("<script language=\"javascript\"> alert('新增錯誤_該商品已存在');window.history.go(-1); ;</script>");
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