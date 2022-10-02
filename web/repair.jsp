<%--
  Created by IntelliJ IDEA.
  User: andyc
  Date: 2020/8/17
  Time: 下午 02:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>repair</title>
        <meta charset=" utf-8">
        <meta name="author" content="//www.jb51.net/" />
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <style>body{background-color: #dce2e2;</style>
        <script language="javascript">
            function printdiv(printpage)
            {
                var newstr = printpage.innerHTML;
                var oldstr = document.body.innerHTML;
                document.body.innerHTML =newstr;
                window.print();
                document.body.innerHTML=oldstr;
                return false;
            }
            window.onload=function()
            {
                var bt=document.getElementById("bt");
                var div_print=document.getElementById("div_print");
                bt.onclick=function()
                {
                    printdiv(div_print);
                }
            }
        </script>
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

        <div id="div_print">

            <div style="text-align:center" class="container py-5"><h2><strong>報修單</strong></h2></div>
            <table border="1"  bgcolor="white" align="center" width="80%">
                <tr>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb">客戶<br>名稱</font></td>
                    <td width="12%"><input type="text" name="name" class="form-control" placeholder="請輸入名稱" required /></td>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb">專案<br>名稱</font></td>
                    <td width="14%" colspan="3"><input type="text" name="project" class="form-control"  placeholder="請輸入專案名稱" required /></td>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb">服務<br>時間</font></td>
                    <td width="12%" align="right"><input type="datetime-local" name="date" class="form-control" placeholder="" required /></td>
                </tr>
                <tr>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb"><br>服<br>務<br>項<br>目<br><br></font></td>
                    <td colspan="3" style="line-height:40px;"><font size="5" face="DFKai-sb">
                        <input type="radio" value="1" name="radiobutton" style="zoom: 1.5">裝機服務<br>
                        <input type="radio" value="2" name="radiobutton" style="zoom: 1.5">例行維護<br>
                        <input type="radio" value="3" name="radiobutton" style="zoom: 1.5">緊急呼叫<br>
                        <input type="radio" value="4" name="radiobutton" style="zoom: 1.5">其他<br>
                        <input type="text" name="" class="form-control"  placeholder="其他" required />
                    </font></td>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb"><br>客<br>戶<br>資<br>訊<br><br></font></td>
                    <td colspan="3"><font size="5" face="DFKai-sb">聯絡人:</font><input type="text" name="name" class="form-control" placeholder="請輸聯絡人" required />
                        <font size="5" face="DFKai-sb">地址:</font><input type="text" name="" class="form-control" placeholder="請輸入地址" required />
                        <font size="5" face="DFKai-sb">連絡電話:</font><input type="tel" name="tel" class="form-control" placeholder="請輸入有效電話" required /></font></td>
                </tr>
                <tr>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb"><br>問<br>題<br>&nbsp;</font></td>
                    <td colspan="7"><textarea type="text" name="" class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea></td>
                </tr>
                <tr>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb"><br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>處<br>理<br>說<br>明<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;</font></td>
                    <td colspan="7"><textarea type="text" name="" class="form-control" id="exampleFormControlTextarea1" rows="19"></textarea></td>
                </tr>
                <tr>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb">服<br>務<br>資<br>訊</font></td>
                    <td colspan="3"><font size="5" face="DFKai-sb">服務時數:</font><input type="text" name="number" class="form-control" placeholder="請輸入時數" required />
                        <font size="5" face="DFKai-sb">交通費用:</font><input type="text" name="number" class="form-control" placeholder="請輸入費用" required /></td>
                    <td width="4%" align="center"><font size="5" face="DFKai-sb">客<br>戶<br>簽<br>名</font></td>
                    <td colspan="3" align="left" valign="bottom"><font size="5" face="DFKai-sb">日期:</font></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><font size="5" face="DFKai-sb">無敵科技人員簽核</font></td>
                </tr>
                <tr>
                    <td align="center"><font size="5" face="DFKai-sb"><br>部門<br>&nbsp;</font></td>
                    <td>&nbsp;</td>
                    <td align="center"><font size="5" face="DFKai-sb">部門<br>主管</font></td>
                    <td colspan="3">&nbsp;</td>
                    <td align="center"><font size="5" face="DFKai-sb">技術<br>人員</font></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

        <div class="container py-5">
            <div class="row justify-content-center align-items-center">
                <div col order-2>
                    <input name="print" type="button" class="btn btn-dark" id="bt" value="點選列印" />
                </div>
                <div class="col-md-1"></div>
                <div col order-1>
                    <button type="button" class="btn btn-outline-dark" onclick="location.href='search.jsp'">上一頁</button>
                </div>
            </div>
        </div>
    </body>
</html>
