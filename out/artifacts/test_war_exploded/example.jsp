<%--
  Created by IntelliJ IDEA.
  User: Ricky
  Date: 2020/7/22
  Time: 下午 03:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
        if (session.getAttribute("sess_userid") == null)
        {
            out.println("<script type=\"text/javascript\">alert('無效操作');window.location.href = 'login.html';</script>");
        }
        else
        {
            //你們的code放這裡
        }
%>
<html>
<head>
    <title>測試是否登入範例</title>
</head>
