<%--
  Created by IntelliJ IDEA.
  User: calvi
  Date: 2020/7/22
  Time: �W�� 11:24
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
        if (role.equals("1")){
            out.println("<script language=\"javascript\">alert('�A�L�v���ާ@'); window.location.href = 'salepage.jsp'; </script>");
        }
        else {
    String client_name = request.getParameter("client_name");
    String driver = "com.mysql.jdbc.Driver";
    String url =  "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";;
    String userid = "besta";
    String password = "besta123";
    String state1 ="�ʳf��";
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
    Statement statement1 = null;
    ResultSet rs = null;
    ResultSet sm = null;
%>
<%
    try{
        connection = DriverManager.getConnection(url, userid, password);
        statement=connection.createStatement();
        statement1=connection.createStatement();
        String sql ="select * from sale_data natural join sale_list where client_name='"+client_name+"'";
         rs = statement.executeQuery(sql);

        String sql1 ="SELECT * FROM `sale_list` WHERE `sale_id`!=0 ";
         sm = statement1.executeQuery(sql1);
        while(rs.next())
        {
%>
<html>
<style>
    #client_phone1{display:none;}
    #sale_phone1{display:none;}
</style>
    <head>
        <title>�ק�P����</title>
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
            <a class="navbar-brand" href="#">�L�Ĭ�ުѥ��������q</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark"  onclick="location.href='admin.jsp'">����<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('�z�T�w�n�n�X��?')) return true;else return false"><a href="logout.jsp" style="color:white;">�n�X</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h2><strong>�ק���</strong></h2></div>
        <form method="post" action="sale_update_process.jsp" class="add-item" name="form1">
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>���Ƥ��</label>
                        <input type="text" name="date" readonly="readonly" class="form-control" placeholder="�п�J���" required />
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
                        <label for="Name">�Ȥ�W��</label>
                        <input type="text" readonly="readonly" name="client_name" class="form-control" id="Name" value="<%=rs.getString("client_name") %>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�Ȥ��p���H</label>
                        <input type="text" class="form-control" name="client_contact" ID="client_contact"  value="<%=rs.getString("client_contact") %>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">�Ȥ��p���H�q��</label>
                        <select  id="choose_type" >
                            <option value="A">��ʹq��</option>
                            <option value="B">���ιq��</option>
                        </select>
                        <input type="text" class="form-control" name="client_phone" id="client_phone" maxlength="10" placeholder="ex: 09XX-XXX-XXX" value="<%=rs.getString("client_phone") %>"  />
                        <input type="text" class="form-control" name="client_phone" id="client_phone1" maxlength="17" placeholder="ex: XX-XXXXXXXX#XXX" value="<%=rs.getString("client_phone") %>"  />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�g�P�ӦW��</label>
                        <select class="selectpicker show-tick form-control" name="sale_name" value="<%=rs.getString("sale_name") %>" required/>
                        <option ><%=rs.getString("sale_name") %></option>
                        <%
                            while(sm.next())
                            {
                                if(!sm.getString("sale_name").equals(rs.getString("sale_name")))
                                {
                                    out.print("<option> " + sm.getString("sale_name") + " </option>");
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
                        <input type="text" class="form-control" name="sale_contact" id="sale_contact" value="<%=rs.getString("sale_contact") %>" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">�g�P���p���H�q��</label>
                        <select  id="choose_type1" >
                            <option value="A">��ʹq��</option>
                            <option value="B">���ιq��</option>
                        </select>
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone" maxlength="10" placeholder="ex: 09XX-XXX-XXX" value="<%=rs.getString("sale_phone") %>"  />
                        <input type="text" class="form-control" name="sale_phone" id="sale_phone1" maxlength="17" placeholder="ex: XX-XXXXXXXX#XXX" value="<%=rs.getString("sale_phone") %>"  />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number1">�H�y���Ѿ��ƶq</label>
                        <input type="number" name="face_num" class="form-control" id="number1" placeholder="�п�J���ļƦr" value="<%=rs.getString("face_num") %>" min="0" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label for="number">���������ž��ƶq</label>
                        <input type="number" name="hot_num" class="form-control" id="number" placeholder="�п�J���ļƦr" value="<%=rs.getString("hot_num") %>" min="0" required />
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>�ثe���A</label>
                        <select class="selectpicker show-tick form-control" name="state" value="<%=rs.getString("state") %>" required/>
                            <option ><%=rs.getString("state") %></option>
                        <%
                            if(!rs.getString("state").equals("����f"))
                            {
                                out.print("<option>����f</option>");

                            }
                            if(!rs.getString("state").equals("�Ƴf��"))
                            {
                                out.print("<option>�Ƴf��</option>");

                            }
                            if(!rs.getString("state").equals(state1))
                            {
                                out.print("<option>�ʳf��</option>");

                            }
                            if(!rs.getString("state").equals("�e�f��"))
                            {
                                out.print("<option>�e�f��</option>");

                            }
                            if(!rs.getString("state").equals("�w�e�F"))
                            {
                                out.print("<option>�w�e�F</option>");

                            }
                        %>
                        </select>
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
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='salesdata.jsp'">�W�@��</button>
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
                }
                connection.close();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            }}
        %>
    </body>
</html>
