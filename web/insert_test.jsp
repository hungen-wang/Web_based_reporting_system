<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/21
  Time: 下午 01:51
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
        if (role.equals("1"))
        {
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else
            {

            String driver = "com.mysql.jdbc.Driver";
            String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
            String userid = "besta";
            String password = "besta123";
            try
            {
                Class.forName(driver);
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
%>
<%
    try{
        connection = DriverManager.getConnection(url, userid, password);
        statement=connection.createStatement();
        String sql ="SELECT * FROM `sale_list` WHERE `sale_id`!=0 ";
        rs = statement.executeQuery(sql);


%>
<html>
<style>
#client_phone1{display:none;}
#sale_phone1{display:none;}
</style>
    <head>
        <title>更新銷售資料</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>
        <div style="text-align:center" class="container py-5"><h2><strong>新增資料</strong></h2></div>

        <form method="post" action="sale_insert.jsp" class="add-item" name="form1">

            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>報備日期</label>
                        <input type="text" name="date" readonly="readonly" class="form-control" placeholder="請輸入日期" required />
                        <script language="javascript">
                            today=new Date();
                            form1.date.value=today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                        </script>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="Name">客戶名稱</label>
                        <input type="text" class="form-control" name="client_name" ID="Name" placeholder="請輸入客戶名稱" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>客戶聯絡人</label>
                        <input type="text" class="form-control" name="client_contact" ID="client_contact" placeholder="請輸入真實姓名" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">客戶聯絡人電話</label>
                        <select  id="choose_type" >
                            <option value="A">行動電話</option>
                            <option value="B">市用電話</option>
                        </select>
                        <input type="text" class="form-control" name="client_phone" maxlength="10" id="client_phone" placeholder="ex: 09XX-XXX-XXX"   />
                        <input type="text" class="form-control" name="client_phone" maxlength="17" id="client_phone1" placeholder="ex: XX-XXXXXXXX#XXX"   />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>經銷商名稱</label>
                        <select class="selectpicker show-tick form-control" name="sale_name"  required/>
                        <%
                            while(rs.next())
                            {
                                    out.print("<option> " + rs.getString("sale_name") + " </option>");

                            }
                        %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>經銷商聯絡人</label>
                        <input type="text" class="form-control" name="sale_contact" ID="sale_contact" placeholder="請輸入真實姓名" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">經銷商聯絡人電話</label>
                        <select  id="choose_type1" >
                            <option value="A">行動電話</option>
                            <option value="B">市用電話</option>
                        </select>
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone" maxlength="10" placeholder="ex: 09XX-XXX-XXX"   />
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone1" maxlength="17" placeholder="ex: XX-XXXXXXXX#XXX"   />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number1">人臉辨識機數量</label>
                        <input type="number" class="form-control" name="face_num" id="number1" placeholder="請輸入有效數字" min="0" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">熱成像測溫機數量</label>
                        <input type="number" class="form-control" name="hot_num" id="number" placeholder="請輸入有效數字"  min="0" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>目前狀態</label>
                        <select class="selectpicker show-tick form-control" name="state" required>
                            <option disabled selected hidden>請選擇目前狀態</option>
                            <option>備貨中</option>
                            <option>未交貨</option>
                            <option>送貨中</option>
                            <option>缺貨中</option>
                            <option>已送達</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div col order-2>
                        <input type="submit" class="btn btn-success" value="送出" onclick="if(confirm('您確定送出嗎?')) return true;else return false">
                    </div>
                    <div class="col-md-1"></div>
                    <div col order-1>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='salesdata.jsp'">上一頁</button>
                    </div>
                </div>
            </div>
        </form>
        <script type="text/javascript">
            document.getElementById('choose_type').onchange=function()
            {
                var client_phone =document.getElementById('client_phone'),client_phone1=document.getElementById('client_phone1');
                client_phone.style.display=client_phone1.style.display='none';
                if(this.value=='A')
                {
                    if(document.getElementById("client_phone").disabled = true)
                    {
                        document.getElementById("client_phone").disabled = false
                    }
                    client_phone.style.display='inline-block';
                    document.getElementById("client_phone1").disabled = true;
                }
                else if(this.value=='B')
                {
                    if(document.getElementById("client_phone1").disabled = true)
                    {
                        document.getElementById("client_phone1").disabled = false
                    }
                    client_phone1.style.display='inline-block';
                    document.getElementById("client_phone").disabled = true;
                }
            };

            document.getElementById('choose_type1').onchange=function()
            {
                var sale_phone =document.getElementById('sale_phone'),sale_phone1=document.getElementById('sale_phone1');
                sale_phone.style.display=sale_phone1.style.display='none';
                if(this.value=='A')
                {
                    if(document.getElementById("sale_phone").disabled = true)
                    {
                        document.getElementById("sale_phone").disabled = false
                    }
                    sale_phone.style.display='inline-block';
                    document.getElementById("sale_phone1").disabled = true;
                }
                else if(this.value=='B')
                {
                    if(document.getElementById("sale_phone1").disabled = true)
                    {
                        document.getElementById("sale_phone1").disabled = false
                    }
                    sale_phone1.style.display='inline-block';
                    document.getElementById("sale_phone").disabled = true;
                }
            };
        </script>
        <%
                    connection.close();
                }
            catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
}
        %>
    </body>
</html>
