<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/23
  Time: 上午 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
                String id = request.getParameter("userid");
                String sess_username = (String)session.getAttribute("sess_username");
%>
<html>
    <head>
        <title>更變密碼</title>
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

        <div style="text-align:center" class="container py-5"><h2><strong>更變密碼</strong></h2></div>
        <form method="post" action="admin_change_passwd_process.jsp" onsubmit="return check_final()" class="add-item">
            <input type="hidden" name="user_id" value="<%=id%>">
            <div class="container py-3">
                <div class="row justify-content-around align-items-center">
                    <div class="col-4">
                        <label>舊密碼</label>
                        <input type="password" name="old_pass" class="form-control" placeholder="請輸入舊密碼" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around align-items-center">
                    <div class="col-4">
                        <label>新密碼</label>
                        <input type="password" name="new_pass" id="password" onkeyup='check();' class="form-control" placeholder="請輸入新密碼" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around align-items-center">
                    <div class="col-4">
                        <label>確認密碼</label>
                        <input type="password" name="confirm_password" id="confirm_password" onkeyup='check();' class="form-control" placeholder="請再次輸入新密碼" required />
                        <span id='message'></span>
                    </div>
                </div>
            </div>

            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div>
                        <input type="submit" name="submit" class="btn btn-success" value="送出" onclick="if(confirm('您確定送出嗎?')) return true;else return false">
                    </div>
                    <div class="col-md-1"></div>
                    <div>
                        <button type="button" class="btn btn-outline-dark" onclick="history.go(-1)">上一頁</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
    <script type="text/javascript">
        var check = function() {
            if (document.getElementById('password').value ==
                document.getElementById('confirm_password').value) {
                document.getElementById('message').innerHTML = '';
            } else {
                document.getElementById('message').style.color = 'red';
                document.getElementById('message').innerHTML = '密碼不同';
            }
        }
        var check_final = function() {
            if (document.getElementById('password').value == document.getElementById('confirm_password').value)
            {
                    return true;
            }
            else {
                alert('新密碼不同');
                return false;
            }
        }
    </script>
</html>
<%
    }}
%>