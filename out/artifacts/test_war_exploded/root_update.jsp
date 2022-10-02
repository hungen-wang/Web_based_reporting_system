<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/21
  Time: 下午 01:07
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
        String sess_role = (String)session.getAttribute("role");
        if (sess_role.equals("1")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'salepage.jsp'; </script>");
        }
        else if (sess_role.equals("0")){
            out.println("<script language=\"javascript\">alert('你無權限操作'); window.location.href = 'admin.jsp'; </script>");
        }
        else {
            String sess_username = (String)session.getAttribute("sess_username");
                String id = request.getParameter("id");
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
                    String sql = "SELECT `user_name`,`account`,`password`,`role`,`sale_name`,`phone`,`email`,`ban` ,`user_id`, user_list.sale_id FROM `user_list`,`sale_list` WHERE user_list.sale_id=sale_list.sale_id AND user_list.user_id="+id;
                    rs = stmt.executeQuery(sql);
                    rs.next();
                    String sql_1 = "SELECT * FROM `sale_list` WHERE `sale_id`!=0";
                    sa = stmt_1.executeQuery(sql_1);


                }
                catch (Exception ex){
                    out.println("Database error");
                }
                String user_saleid = rs.getString(10);
                String role = rs.getString("role");
                String ban = rs.getString("ban");
%>
<html>
    <head>

        <title>修改使用者資料</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script language=javascript>
            function updateData(v)
            {
                var value=v.options[v.selectedIndex].value;
                $("#number").empty(); //把'數字' drop down box 清空
                if (value!="") //真的選了選項才丟去server side
                {
                    jQuery.post("root_getResult.jsp","type="+value,updateNumber);
                }
            }
            function updateNumber(data)
            {
                var numberData=jQuery.trim(data).split("\n");//用 \n 來做分資料分割
                var number=document.getElementById("number");
                for (i=0;i<numberData.length;i++)
                {
                    value=numberData[i].split("-")[0];//用 - 來做分資料分割取出value
                    text=numberData[i].split("-")[1]; //用 - 來做分資料分割取出text
                    option=new Option(text,value);    //用這樣的方法 IE 才會work
                    number.options[i]=option;         //
                }
            }
        </script>
        <script type="text/javascript">
            if(document.getElementById("testName").checked)
            {
                document.getElementById('testNameHidden').disabled = true;
            }
        </script>
        <style>body{background-color: #dce2e2;</style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="location.href='root.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h2><strong>修改資料</strong></h2></div>
        <form method="post" action="root_update_process.jsp" class="add-item">
            <input type="hidden" name="user_id" value="<%=rs.getString("user_id")%>">
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>姓名</label>
                        <input type="text" name="name" class="form-control" placeholder="請輸入真實姓名" value="<%=rs.getString("user_name")%>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>使用者帳號</label>
                        <input type="text" name="account" class="form-control" placeholder="請輸入帳號" value="<%=rs.getString("account")%>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>密碼</label>
                        <input type="password" name="password" id="myInput" class="form-control" placeholder="請輸入密碼" disabled value="<%=rs.getString("password")%>" required />
                        <input type="checkbox" onclick="myFunction()">Show Password
                        <a href="root_change_passwd.jsp?userid=<%=id%>">更改密碼</a>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>權限</label>
                        <select name="role" onchange="updateData(this)" class="selectpicker show-tick form-control" placeholder="請選擇權限" required>
                            <%
                                if (role.equals("超級使用者"))
                                {
                                    out.print("<option value=\"超級使用者\" selected>超級使用者</option>");
                                    out.print("<option value=\"系統管理員\">系統管理員</option>");
                                    out.print("<option value=\"標準使用者\">標準使用者</option>");
                                }
                                else if (role.equals("系統管理員"))
                                {
                                    out.print("<option value=\"超級使用者\">超級使用者</option>");
                                    out.print("<option value=\"系統管理員\" selected>系統管理員</option>");
                                    out.print("<option value=\"標準使用者\">標準使用者</option>");
                                }
                                else
                                {
                                    out.print("<option value=\"超級使用者\">超級使用者</option>");
                                    out.print("<option value=\"系統管理員\">系統管理員</option>");
                                    out.print("<option value=\"標準使用者\" selected>標準使用者</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>經銷商</label>
                        <select name="sale_id" id="number" class="selectpicker show-tick form-control" placeholder="請選擇經銷商" required>
                            <%
                                if (role.equals("超級使用者")){out.print("<option selected value=\"0\">無</option>\n");}
                                if (role.equals("系統管理員")){out.print("<option selected value=\"0\">無</option>\n");}
                                else{
                                    while (sa.next())
                                    {
                                        if (user_saleid.equals(sa.getString("sale_id")))
                                        {
                                            out.print("<option selected value=\""+sa.getString("sale_id")+"\">"+sa.getString("sale_name")+"</option>");
                                        }
                                        else
                                        {
                                            out.print("<option value=\""+sa.getString("sale_id")+"\">"+sa.getString("sale_name")+"</option>");
                                        }
                                    }}
                            %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>聯絡電話</label>
                        <select id = "select_main" name="select_main">
                            <option value="A1">行動電話</option>
                            <option value="B1">市用電話</option>
                        </select>
                        <input  type = "text" id = "resultA" name="phone" maxlength="10" class="form-control" placeholder="ex: 09XX-XXX-XXX"  value =<%=rs.getString("phone")%> />
                        <input  type = "text" id = "resultB" name="phone" maxlength="17" class="form-control" placeholder="ex: XX-XXXXXXXX#XXX"   value =<%=rs.getString("phone")%> />
                        <input  type = "text" id = "resultC" name="phone" class="form-control" value =<%=rs.getString("phone")%> />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>電子郵件</label>
                        <input type="text" name="email" class="form-control"  placeholder="請輸入有效電子郵件" value="<%=rs.getString("email")%>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>禁用</label>
                        <%
                            if (ban.equals("0"))
                            {
                                out.print("<input id='testName' type='checkbox' value='1' name='ban' style='zoom: 1.5'>");
                            }
                            else
                            {
                                out.print("<input id='testName' type='checkbox' value='1' name='ban' style='zoom: 1.5' checked>");
                            }
                        %>
                        <input id='testNameHidden' type='hidden' value='0' name='ban' style='zoom: 1.5'>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div>
                        <input type="submit" class="btn btn-success" value="送出" onclick="if(confirm('您確定送出嗎?')) return true;else return false">
                    </div>
                    <div class="col-md-1"></div>
                    <div>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='root_user.jsp'">上一頁</button>
                    </div>
                </div>
            </div>
        </form>
                <%
                    rs.close();
                    stmt.close();
                    con.close();
                    sa.close();
                    stmt_1.close();
                    }}
                %>
                <script>
                    function myFunction()
                    {
                        var x = document.getElementById("myInput");
                        if (x.type === "password")
                        {
                            x.type = "text";
                        }
                        else
                        {
                            x.type = "password";
                        }
                    }
                </script>
        <script type="text/javascript">
            document.getElementById('resultA').style.display = 'none';
            document.getElementById('resultB').style.display = 'none';
            document.getElementById('select_main').onchange=function(){
                var select_sub=document.getElementById('resultA'),input_sub=document.getElementById('resultB'),resultC=document.getElementById('resultC');
                select_sub.style.display=input_sub.style.display=resultC.style.display='none';
                if(this.value=='A1'){
                    if(document.getElementById('resultA').disabled= true) {
                        document.getElementById('resultA').disabled=false;
                    }
                    select_sub.style.display='block';
                    document.getElementById("resultB").disabled = true;
                    document.getElementById("resultC").disabled = true;
                    resultC.type = 'none';
                }else if(this.value=='B1'){
                    if(document.getElementById('resultB').disabled= true) {
                        document.getElementById('resultB').disabled=false;
                    }
                    input_sub.style.display='block';
                    document.getElementById("resultA").disabled = true;
                    document.getElementById("resultC").disabled = true;
                    resultC.type = 'none';
                }
            };
        </script>
    </body>
</html>
