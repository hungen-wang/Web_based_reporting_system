<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=Big5" language="java" %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="java.util.stream.Collectors" %>


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
    Integer sess_saleid = (Integer)session.getAttribute("sess_saleid");
    String date=new String(request.getParameter("date").getBytes("8859_1"));
    String user_name=new String(request.getParameter("user_name").getBytes("8859_1"));
    String client_name=new String(request.getParameter("client_name").getBytes("8859_1"));
    String client_contact=new String(request.getParameter("client_contact").getBytes("8859_1"));
    String client_phone=new String(request.getParameter("client_phone").getBytes("8859_1"));
    String sale_contact=new String(request.getParameter("sale_contact").getBytes("8859_1"));
    String sale_phone=new String(request.getParameter("sale_phone").getBytes("8859_1"));
    String face_num=new String(request.getParameter("face_num").getBytes("8859_1"));
    String hot_num=new String(request.getParameter("hot_num").getBytes("8859_1"));
    String ps=new String(request.getParameter("ps").getBytes("8859_1"));

    String bodyhtml="";
    final String from = "ca2578110@gmail.com"; //�ϥΪ̱b��
    final String pass = "xa1122a33xe1";
    String host = "smtp.gmail.com";



%>
<%

    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        try{

            String db_user="besta";
            String db_pwd="besta123";
            String driver="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://52.79.118.162/besta?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            Class.forName(driver);
            Connection conn= DriverManager.getConnection(url,db_user,db_pwd);
            try
            {
                Statement stmt = conn.createStatement();
                ResultSet rs = null;
                ResultSet rs1 = null;
                ResultSet rs2 = null;

                String sql="select * from sale_list where sale_id = '"+sess_saleid+"'";
                rs = stmt.executeQuery(sql);
                rs.next();
                String yu_shian=rs.getString("sale_id");
                try {
                                   int i = stmt.executeUpdate("insert into testdata(user_name,client_name,client_contact,client_phone,sale_id,sale_contact,sale_phone,face_num,hot_num,ps)values('" + user_name + "','"
                                          + client_name + "','"+ client_contact + "','" + client_phone + "','" + yu_shian + "','" + sale_contact + "','" + sale_phone + "','" + face_num + "','" + hot_num + "','" + ps + "')");
                                  // out.print("success!");
                                   //out.print("<script>alert('�s�W���\�o!Alex�n�δ�'); window.location='salepage.jsp' </script>");
                                   int j = stmt.executeUpdate("insert into sale_data(client_name,client_contact,client_phone,sale_id,sale_contact,sale_phone,date,face_num,hot_num,state)values('" + client_name + "','" + client_contact + "','" + client_phone + "','" + yu_shian + "','" + sale_contact + "','" + sale_phone + "','" + date + "','" + face_num + "','" + hot_num + "', '�w����' )");
                                   //out.print("successfully!");
                                   out.print("<script>alert('���פw�Q����'); window.location='search.jsp' </script>");
                                   rs.close();


                    String sql_2 = "select sale_name  from user_list join sale_list where user_name = '" + user_name + "' AND  user_list.sale_id = sale_list.sale_id";
                    rs2 = stmt.executeQuery(sql_2);
                    rs2.next();
                    String sale_name = rs2.getNString(1);


                    String sub = "" + sale_name + "���Ƴq��_" + client_name + "�w�����n��_" + date;
                    bodyhtml = bodyhtml
                            + sale_name
                            + "<p>�w����ƨt�Χ�����Ƶn�J�A���e�p�U:"
                            + "<p>�g�P���p���H:" + sale_contact
                            + "<p>�g�P���p���q��:" + sale_phone
                            + "<p>�Ȥ᤽�q�W��:" + client_name
                            + "<p>�Ȥ᤽�q�p���H�W��:" + client_contact
                            + "<p>�Ȥ��p���H�q��:" + client_phone
                            + "<p>�H�y���Ѿ��ƶq:" + face_num
                            + "<p>���������ž��ƶq:" + hot_num
                            + "<p>���Ƥ��      :" + date;

                    Properties props = new Properties();

                    props.put("mail.smtp.host", host);
                    props.put("mail.transport.protocol", "smtp");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.user", from);
                    props.put("mail.password", pass);
                    props.put("mail.smtp.port", "587");

                    //����|�ܪ���
                    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(from, pass);
                                }
                            }
                    );

                    String sql_1 = "select email  from user_list  where user_name = '" + user_name + "'OR role='�t�κ޲z��' ";
                    rs1 = stmt.executeQuery(sql_1);

                    List<String> mylist = new LinkedList<String>();
                    while (rs1.next()) {

                        String total = rs1.getString("email");
                        mylist.add(total);

                    }

                    String to = mylist.stream().collect(Collectors.joining(","));
                    String[] toList = to.split(",");

                    InternetAddress[] toAddress = new InternetAddress[toList.length]; //���r���ƥ�
                    int counter = 0;
                    for (String recipient : toList) {
                        toAddress[counter] = new InternetAddress(recipient.trim());
                        counter++;
                    }

                        try {
                            request.setCharacterEncoding("Big5");
                            MimeMessage message = new MimeMessage(mailSession);
                            message.setFrom(new InternetAddress(from));
                            message.setRecipients(Message.RecipientType.BCC, toAddress);

                            message.setSubject(sub);

                            Multipart mp = new MimeMultipart();
                            MimeBodyPart mbp = new MimeBodyPart();
                            mbp.setContent(bodyhtml, "text/html;charset=MS950");
                            mp.addBodyPart(mbp);
                            message.setContent(mp);

                            Transport.send(message);
                            out.print("ok");


                        } catch (MessagingException mex) {
                            mex.printStackTrace();
                            out.print("error");
                        }

                }
                catch (Exception e)
                {
                    out.println("can't read data");
                    out.println(e.toString());
                }
            }
            catch (Exception e)
            {
                out.println("can't create statement");
                out.println(e.toString());
            }
        }
        catch(Exception e)
        {
            out.println("can't content mysql database");
            out.println(e.toString());
        }

    }
    catch(Exception e)
    {
        out.println("can't load mysql driver");
        out.println(e.toString());
    }
    }}
%>



