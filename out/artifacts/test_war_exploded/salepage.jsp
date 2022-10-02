<%@ page contentType="text/html;charset=Big5" language="java" %>
<%@ page import="java.sql.*,java.util.*" %>
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
    String sess_username = (String)session.getAttribute("sess_username");
    //Integer sess_sale = (Integer) session.getAttribute("sess_saleid");
%>
<%
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
    Connection conn = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try{
        conn = DriverManager.getConnection(url,db_user,db_pwd);
        statement=conn.createStatement();

        Statement st = null;
        Statement st1 = null;
        Statement st2 = null;
        Statement st3 = null;
        Statement st4 = null;

        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        ResultSet rs4 = null;

        st=conn.createStatement();
        String sql1 ="select * from items";
        rs = st.executeQuery(sql1);

        st1=conn.createStatement();
        String sql2 ="select * from items";
        rs1 = st1.executeQuery(sql2);

        st2=conn.createStatement();
        String sql3 ="select * from items";
        rs2 = st2.executeQuery(sql3);

        st3=conn.createStatement();
        String sql4 ="select * from items";
        rs3 = st3.executeQuery(sql4);

        st4=conn.createStatement();
        String sql5 ="select * from items";
        rs4 = st4.executeQuery(sql5);

        String sql ="select * from user_list natural join sale_list where user_name = '"+sess_username+"'";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){

%>
<html>
    <head>
        <title>報備員介面</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>
            #cl{display:none;}
        </style>
        <style>body{background-color: #dce2e2;}</style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">無敵科技股份有限公司</a>
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="location.href='search.jsp'">首頁<span class="sr-only">(current)</span></button>
                </li>
                <li class="nav-item active">
                    <button type="button" class="btn btn-dark" onclick="if(confirm('您確定要登出嗎?')) return true;else return false"><a href="logout.jsp" style="color:white;">登出</a><span class="sr-only">(current)</span></button>
                </li>
            </ul>
        </nav>

        <div style="text-align:center" class="container py-5"><h2><strong>新增資料</strong></h2></div>
            <form name="form1" method="POST" action="inserting.jsp" class="add-item">
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
                            <label>報備人員</label>
                            <input type="text" name="user_name" readonly="readonly" class="form-control" placeholder="請輸入報備人員名稱" value=<%=sess_username%> required />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>客戶名稱</label>
                            <input type="text" name="client_name" class="form-control" placeholder="請輸入客戶名稱" required />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>客戶公司聯絡人</label>
                            <input type="text" name="client_contact" class="form-control" placeholder="請輸入聯絡人名稱" required />
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
                            <input type = "text" id = "resultA" name="client_phone" maxlength="10" class="form-control" placeholder="ex: 09XX-XXX-XXX" />
                            <input type = "text" id = "resultB" name="client_phone" maxlength="17" class="form-control" placeholder="ex: XX-XXXXXXXX#XXX" />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>經銷商名稱</label>
                            <input type="text" name="sale_name" readonly="readonly" class="form-control"  value=<%=resultSet.getString("sale_name")%> required />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>經銷商聯絡人</label>
                            <input type="text" name="sale_contact" readonly="readonly" class="form-control" value=<%=sess_username%> required />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>經銷商聯絡電話</label>
                            <input type="text" name="sale_phone" readonly="readonly" maxlength="10" class="form-control" placeholder="請輸入有效電話" value=<%=resultSet.getString("phone")%> required />
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">
                            <label>交貨日期</label>
                            <input type="date" name="end_date"  maxlength="10" class="form-control"   required />
                        </div>
                    </div>
                </div><div class="container py-3">
                <div class="row justify-content-around">
                    <div class="col-4">
                        <label>預算</label>
                        <input type="text" name="budget"  maxlength="10" class="form-control" placeholder="請妥善輸入正確預算" required />
                    </div>
                </div>
            </div>

                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="col-4">

                <select name="items_name1" id="items_name1">
                    <option>請選擇</option>
                    <%
                        while(rs.next()) {
                            out.println("<option>" + rs.getString("items_name") + "</option>");
                        }
                    %>
                </select>
                        <select name="items_num1" id="items_num1">
                            <option>請選擇數量</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                <input type="button" value="第一筆資料登錄" id="button10" onclick="updatePath()"/>
                <input type="button" value="新增其他商品" id="button1" onclick="newtext()"/>

                <select name="items_name2" id="items_name2" style='display:none'>
                    <option></option>
                    <%
                        while(rs1.next()) {
                            out.println("<option>" + rs1.getString("items_name") + "</option>");
                        }
                    %>
                </select>
                            <select name="items_num2" id="items_num2" style='display:none'>
                                <option>請選擇數量</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                <input type="button" value="第二筆資料登錄" id="button11" style='display:none' onclick="updatePath1()"/>
                <input type="button" value="新增其他商品" id="button2" style='display:none' onclick="newtext1()"/>


                <select name="items_name3" id="items_name3" style='display:none'>
                    <option></option>
                    <%
                        while(rs2.next()) {
                            out.println("<option>" + rs2.getString("items_name") + "</option>");
                        }
                    %>
                </select>
                            <select name="items_num3" id="items_num3" style='display:none'>
                                <option>請選擇數量</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                <input type="button" value="第三筆資料登錄" id="button12" style='display:none' onclick="updatePath2()"/>
                <input type="button" value="新增其他商品" id="button3" style='display:none' onclick="newtext2()"/>


                            <select name="items_name4" id="items_name4" style='display:none'>
                                <option></option>
                                <%
                                    while(rs3.next()) {
                                        out.println("<option>" + rs3.getString("items_name") + "</option>");
                                    }
                                %>
                            </select>
                            <select name="items_num4" id="items_num4" style='display:none'>
                                <option>請選擇數量</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                            <input type="button" value="第四筆資料登錄" id="button13" style='display:none' onclick="updatePath3()"/>
                            <input type="button" value="新增其他商品" id="button4" style='display:none' onclick="newtext3()"/>

                            <select name="items_name5" id="items_name5" style='display:none'>
                                <option></option>
                                <%
                                    while(rs4.next()) {
                                        out.println("<option>" + rs4.getString("items_name") + "</option>");
                                    }
                                %>
                            </select>
                            <select name="items_num5" id="items_num5" style='display:none'>
                                <option>請選擇數量</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                            <input type="button" value="第五筆資料登錄" id="button14" style='display:none' onclick="updatePath4()"/>

                <textarea style="width:400px;height:120px" name="items" id="items"></textarea>
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <div class="row justify-content-around">
                        <div class="form-group col-6">
                            <label for="exampleFormControlTextarea1">備註</label>
                            <textarea type="text" name="ps" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
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
                            <button type="button" class="btn btn-outline-dark" onclick="location.href='search.jsp'">上一頁</button>
                        </div>
                    </div>
                </div>
            </form>
        <%
                }conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            }}

        %>
        <script type="text/javascript">

            document.getElementById('resultB').style.display = 'none';
            document.getElementById('select_main').onchange=function(){
                var select_sub=document.getElementById('resultA'),input_sub=document.getElementById('resultB');
                select_sub.style.display=input_sub.style.display='none';
                if(this.value=='A1'){
                    if(document.getElementById('resultA').disabled=true)
                    {
                        document.getElementById('resultA').disabled=false;
                    }
                    select_sub.style.display='block';
                    document.getElementById("resultB").disabled = true;
                }else if(this.value=='B1'){
                    if(document.getElementById('resultB').disabled=true)
                    {
                        document.getElementById('resultB').disabled=false;
                    }
                    input_sub.style.display='block';
                    document.getElementById("resultA").disabled = true;
                }
            };
        </script>
        <script>
            function newtext(){
                var items_name2 = document.getElementById("items_name2");
                items_name2.style.display = 'block';
                var items_num2 = document.getElementById("items_num2");
                items_num2.style.display = 'block';
                var button2 = document.getElementById("button2");
                button2.style.display = 'block';

                var button11 = document.getElementById("button11");
                button11.style.display = 'block';
                var button1 = document.getElementById("button1");
                button1.style.display = 'none';

            }
            function newtext1(){
                var items_name3 = document.getElementById("items_name3")
                items_name3.style.display = 'block';
                var items_num3 = document.getElementById("items_num3")
                items_num3.style.display = 'block';
                var button3 = document.getElementById("button3")
                button3.style.display = 'block';

                var button12 = document.getElementById("button12")
                button12.style.display= 'block';
                var button2 = document.getElementById("button2");
                button2.style.display = 'none';
            }
            function newtext2(){
                var items_name4 = document.getElementById("items_name4")
                items_name4.style.display = 'block';
                var items_num4 = document.getElementById("items_num4")
                items_num4.style.display = 'block';
                var button4 = document.getElementById("button4")
                button4.style.display = 'block';

                var button13= document.getElementById("button13")
                button13.style.display = 'block';
                var button3 = document.getElementById("button3")
                button3.style.display = 'none';
            }
            function newtext3(){
                var items_name5 = document.getElementById("items_name5")
                items_name5.style.display = 'block';
                var items_num5 = document.getElementById("items_num5")
                items_num5.style.display = 'block';

                var button14 = document.getElementById("button14")
                button14.style.display = 'block';
                var button4 = document.getElementById("button4")
                button4.style.display = 'none';
            }

            function updatePath(){
                form=document.form1;
                index1=form.items_name1.selectedIndex;
                index2=form.items_num1.selectedIndex;

                    text1=form.items_name1.options[index1].text;
                    text2=form.items_num1.options[index2].text;
                    form.items.value=text1+" : "+text2;
            }

            function updatePath1(){
                form=document.form1;
                index1=form.items_name1.selectedIndex;
                index2=form.items_num1.selectedIndex;
                index3=form.items_name2.selectedIndex;
                index4=form.items_num2.selectedIndex;

                    text1=form.items_name1.options[index1].text;
                    text2=form.items_num1.options[index2].text;
                    text3=form.items_name2.options[index3].text;
                    text4=form.items_num2.options[index4].text;
                    form.items.value=text1+" : "+text2+"\n"+text3+" : "+text4;
            }

            function updatePath2(){
                form=document.form1;
                index1=form.items_name1.selectedIndex;
                index2=form.items_num1.selectedIndex;
                index3=form.items_name2.selectedIndex;
                index4=form.items_num2.selectedIndex;
                index5=form.items_name3.selectedIndex;
                index6=form.items_num3.selectedIndex;

                text1=form.items_name1.options[index1].text;
                text2=form.items_num1.options[index2].text;
                text3=form.items_name2.options[index3].text;
                text4=form.items_num2.options[index4].text;
                text5=form.items_name3.options[index5].text;
                text6=form.items_num3.options[index6].text;
                form.items.value=text1+" : "+text2+"\n"+text3+" : "+text4+"\n"+text5+" : "+text6;
            }
            function updatePath3(){
                form=document.form1;
                index1=form.items_name1.selectedIndex;
                index2=form.items_num1.selectedIndex;
                index3=form.items_name2.selectedIndex;
                index4=form.items_num2.selectedIndex;
                index5=form.items_name3.selectedIndex;
                index6=form.items_num3.selectedIndex;
                index7=form.items_name4.selectedIndex;
                index8=form.items_num4.selectedIndex;

                text1=form.items_name1.options[index1].text;
                text2=form.items_num1.options[index2].text;
                text3=form.items_name2.options[index3].text;
                text4=form.items_num2.options[index4].text;
                text5=form.items_name3.options[index5].text;
                text6=form.items_num3.options[index6].text;
                text7=form.items_name4.options[index7].text;
                text8=form.items_num4.options[index8].text;
                form.items.value=text1+" : "+text2+"\n"+text3+" : "+text4+"\n"+text5+" : "+text6+"\n"+text7+" : "+text8;
            }
            function updatePath4(){
                form=document.form1;
                index1=form.items_name1.selectedIndex;
                index2=form.items_num1.selectedIndex;
                index3=form.items_name2.selectedIndex;
                index4=form.items_num2.selectedIndex;
                index5=form.items_name3.selectedIndex;
                index6=form.items_num3.selectedIndex;
                index7=form.items_name4.selectedIndex;
                index8=form.items_num4.selectedIndex;
                index9=form.items_name5.selectedIndex;
                index10=form.items_num5.selectedIndex;

                text1=form.items_name1.options[index1].text;
                text2=form.items_num1.options[index2].text;
                text3=form.items_name2.options[index3].text;
                text4=form.items_num2.options[index4].text;
                text5=form.items_name3.options[index5].text;
                text6=form.items_num3.options[index6].text;
                text7=form.items_name4.options[index7].text;
                text8=form.items_num4.options[index8].text;
                text9=form.items_name4.options[index9].text;
                text10=form.items_num4.options[index10].text;
                form.items.value=text1+" : "+text2+"\n"+text3+" : "+text4+"\n"+text5+" : "+text6+"\n"+text7+" : "+text8+"\n"+text9+" : "+text10;
            }
        </script>
    </body>
</html>