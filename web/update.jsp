<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=Big5" language="java" %>
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
    String client_name = request.getParameter("client_name");
    String db_user="besta";
    String db_pwd="besta123";
    String driver="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e)
    {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">修改頁面</a>
    <ul class="nav justify-content-end">
        <li class="nav-item active">
            <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
        </li>
    </ul>
</nav>
<div style="text-align:center" class="container py-5"><h2><strong>修改資料</strong></h2></div>
<%
    try{
        connection = DriverManager.getConnection(url,db_user,db_pwd);
        statement=connection.createStatement();
        String sql ="select * from testdata where client_name='"+ client_name +"' ";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
%>
<html>
    <head>
        <title>修改頁面</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
    </head>
    <body>
        <form method="post" action="update_process.jsp" class="add-item">
            <input type="hidden" name="user_name" value="<%=resultSet.getString("user_name") %>">
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-md-4">
                        <label>客戶公司名稱</label>
                        <input type="text" readonly="readonly" name="client_name" class="form-control" value="<%=resultSet.getString("client_name") %>">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-md-4">
                        <label>客戶聯絡人</label>
                        <input type="text"  name="client_contact" class="form-control" value="<%=resultSet.getString("client_contact") %>">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>客戶聯絡人電話</label>
                        <select id = "select_main" name="select_main">

                            <option value="A1">行動電話</option>
                            <option value="B1">市用電話</option>
                        </select>
                        <input  type = "text" id = "resultA" name="client_phone" maxlength="10" class="form-control" placeholder="ex: 09XX-XXX-XXX"  value =<%=resultSet.getString("client_phone")%> />
                        <input  type = "text" id = "resultB" name="client_phone" maxlength="17" class="form-control" placeholder="ex: XX-XXXXXXXX#XXX"   value =<%=resultSet.getString("client_phone")%> />
                        <input  type = "text" id = "resultC" name="client_phone" class="form-control" value =<%=resultSet.getString("client_phone")%> />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-md-4">
                        <label for="number5">人臉辨識機數量</label>
                        <input type="number" id="number5" name="face_num" class="form-control" min="0" value="<%=resultSet.getString("face_num") %>">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-md-4">
                        <label for="number6">熱成像辨識機數量</label>
                        <input type="number" id="number6" name="hot_num" class="form-control" min="0" value="<%=resultSet.getString("hot_num") %>">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="form-group col-6">
                        <label for="exampleFormControlTextarea2">備註</label>
                        <textarea type="text" name="ps" class="form-control" id="exampleFormControlTextarea2" rows="5" value="<%=resultSet.getString("ps")%>"></textarea>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div col order-2>
                        <input type="submit" class="btn btn-success" value="送出">
                    </div>
                    <div class="col-md-1"></div>
                    <div col order-1>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='search.jsp'">上一頁</button>
                    </div>
                </div>
            </div>
        </form>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            }}
        %>
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