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
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('�A�L�v���ާ@'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
    String Id = request.getParameter("Id");
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
    Statement st = null;
    ResultSet resultSet = null;
    ResultSet rs = null;
%>
<%
    try{
        connection = DriverManager.getConnection(url,db_user,db_pwd);
        statement=connection.createStatement();

        String sql ="select * from sale_manage natural join sale_list where Id='"+ Id +"' ";
        resultSet = statement.executeQuery(sql);

        while(resultSet.next()){
%>
<html>
<style>
    #sale_phone1{display:none;}
</style>
    <head>
        <title>�ק���</title>
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
            <a class="navbar-brand" href="#">�L�Ĭ�ުѥ��������q</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="location.href='admin.jsp'">����<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('�z�T�w�n�n�X��?')) return true;else return false"><a href="logout.jsp" style="color:white;">�n�X</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
            </div>
        </nav>

        <div style="text-align:center" class="container py-5"><h2><strong>�ק���</strong></h2></div>
        <form method="post" action="distributor_update_process.jsp" class="add-item">
            <input type="hidden" name="Id" value="<%=resultSet.getString("Id")%>">
            <%
                st=connection.createStatement();
            String sql1 ="select * from sale_list";
            rs = st.executeQuery(sql1);
            %>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�g�P�ӦW��</label>
                        <select name="sale_name" class="selectpicker show-tick form-control" placeholder="�п�ܸg�P��" required>
                            <option ><%=resultSet.getString("sale_name")%></option>
                            <%
                                while(rs.next()) {
                                    if (!resultSet.getString("sale_name").equals(rs.getString("sale_name"))) {
                                        out.println("<option>" + rs.getString("sale_name") + "</option>");
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�g�P���p���H</label>
                        <input type="text" name="sale_contact" class="form-control" value="<%=resultSet.getString("sale_contact") %>" placeholder="�п�J�p���H�W��" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�g�P���p���q��</label>
                        <select  id="choose_type1" >
                            <option value="A">��ʹq��</option>
                            <option value="B">���ιq��</option>
                        </select>
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone" maxlength="10" placeholder="ex: 09XX-XXX-XXX" value="<%=resultSet.getString("sale_phone") %>"  />
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone1" maxlength="17" placeholder="ex: XX-XXXXXXXX#XXX" value="<%=resultSet.getString("sale_phone") %>"  />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�O�_�T�Φ��g�P��</label>
                        <%
                            if(resultSet.getString("banned").equals("�O")){
                        %><input id = "testName2" style="zoom: 1.5" type="checkbox" name="banned" value="�O" checked>
                        <input id = "testNameHidden2" style="zoom: 1.5" type = "hidden" name = "banned" value="�_">
                        <br>

                        <%}
                        else
                        {
                        %>
                        <input id = "testName2" style="zoom: 1.5" type = "checkbox" name = "banned" value = "�O">
                        <input id = "testNameHidden2" style="zoom: 1.5" type="hidden" name="banned" value="�_">
                        <br>
                        <%
                            }%>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�H�y���Ѿ��O�_�i�c��</label>
                        <%
                            if(resultSet.getString("face_check").equals("�i�H")){
                        %><input id = "testName" style="zoom: 1.5" type="checkbox" name="face_check" value="�i�H" checked>
                        <input id = "testNameHidden" style="zoom: 1.5" type = "hidden" name = "face_check" value="����">
                        <br>

                        <%}
                        else
                        {
                        %>
                        <input id = "testName" style="zoom: 1.5" type = "checkbox" name = "face_check" value = "�i�H">
                        <input id = "testNameHidden" style="zoom: 1.5" type="hidden" name="face_check" value="����">
                        <br>
                        <%
                            }%>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>���������Ѿ��O�_�i�c��</label>
                        <%
                            if(resultSet.getString("hot_check").equals("�i�H")){
                        %><input id = "testName1" style="zoom: 1.5" type="checkbox" name="hot_check" value="�i�H" checked>
                        <input id ="testNameHidden1" style="zoom: 1.5" type ="hidden" name="hot_check" value="����">
                        <br>

                        <%}
                        else
                        {
                        %>
                        <input id = "testName1" style="zoom: 1.5" type = "checkbox" name = "hot_check" value = "�i�H">
                        <input id = "testNameHidden1" style="zoom: 1.5" type="hidden" name="hot_check" value="����">
                        <br>
                        <%
                            }%>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-center align-items-center">
                    <div>
                        <input type="submit" class="btn btn-success" value="�e�X" onclick="if(confirm('�z�T�w�e�X��?')) return true;else return false">
                    </div>
                    <div class="col-md-1"></div>
                    <div>
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='distributor_data.jsp'">�W�@��</button>
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