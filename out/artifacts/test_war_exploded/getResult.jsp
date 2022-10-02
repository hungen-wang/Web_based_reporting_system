<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%  String type=request.getParameter("type");
  int i;
  if (type!=null)
  {
    if (type.equals("系統管理員")) //單數
    {
      out.println("0-無");//因為用戶端會用 \n 來做分資料分割所以一定要ends with \n
    }
    else
    {
      if (type.equals("標準使用者")) //雙數
      {	
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
            String sql = "SELECT * FROM `sale_list` WHERE `sale_id`!=0 ";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {

                out.println(rs.getString("sale_id") + "-" + rs.getString("sale_name"));//因為用戶端會用 \n 來做分資料分割所以一定要ends with \n
            }
			rs.close();
      }
    }
  }%>