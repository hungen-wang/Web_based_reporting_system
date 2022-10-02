<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/21
  Time: 下午 01:51
  To change this template use File | Settings | File Templates.
--%>
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
                %>
<html>
<style>
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
        <script type="text/javascript">
            if(document.getElementById("testName").checked)
            {
                document.getElementById('testNameHidden').disabled = true;
            }


            if(document.getElementById("testName1").checked)
            {
                document.getElementById("testNameHidden1").disabled = true;
            }

            if(document.getElementById("testName2").checked)
            {
                document.getElementById('testNameHidden2').disabled = true;
            }

        </script>
        <style>body{background-color: #dce2e2;</style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="location.href='admin.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>
        <div style="text-align:center" class="container py-5"><h2><strong>新增資料</strong></h2></div>
        <form method="post" action="distributor_insert_process.jsp" class="add-item" name="form1">
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="bday">經銷商名稱</label>
                        <input type="text"  class="form-control" name="sale_name" id="bday" placeholder="請輸入經銷商名稱"  required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="Name">經銷商聯絡人</label>
                        <input type="text" class="form-control" name="sale_contact" ID="Name" placeholder="請輸入真實姓名" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>經銷商連絡電話</label>
                        <select  id="choose_type1" >
                            <option value="A">行動電話</option>
                            <option value="B">市用電話</option>
                        </select>
                        <input type="text" class="form-control" name="sale_phone" maxlength="10" id="sale_phone" placeholder="ex: 09XX-XXX-XXX"   />
                        <input type="text" class="form-control" name="sale_phone" maxlength="17" id="sale_phone1" placeholder="ex: XX-XXXXXXXX#XXX"   />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>是否禁用</label>
                        <input id="testName" type="checkbox" name="banned" value="是" style="zoom: 1.5">
                        <input id="testNameHidden" type="hidden" name="banned" value="否" style="zoom: 1.5">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>是否可銷售人臉辨識機</label>
                        <input id="testName1" type="checkbox" name="face_check" value="可以" style="zoom: 1.5">
                        <input id="testNameHidden1" type="hidden" name="face_check" value="不行" style="zoom: 1.5">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>是否可銷售熱成像測溫機</label>
                        <input id="testName2" type="checkbox" name="hot_check" value="可以" style="zoom: 1.5">
                        <input id="testNameHidden2" type="hidden" name="hot_check" value="不行" style="zoom: 1.5">
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
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='distributor_data.jsp'">上一頁</button>
                    </div>
                </div>
            </div>
        </form>
        <script type="text/javascript">

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
    </body>
</html>
                        <%}}%>