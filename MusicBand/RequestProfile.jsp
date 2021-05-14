<%-- 
    Document   : Myprofile
    Created on : 30 Nov, 2019, 4:07:05 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> User My Profile</title>
    </head>
    <%
    String userid=request.getParameter("id");
 
    String sel="select * from tbl_user u inner join tbl_city p on p.city_id=u.city_id where user_id='"+userid+"'";
    System.out.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
    %>
    <body>
        <h1 align="center">My Profile</h1>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td colspan="2"><div align="center"><img src="../Guest/UserImages/<%=rs.getString("user_photo")%>" width="150xp" height="150xp"></div></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=rs.getString("user_gender")%></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><%=rs.getString("user_dob")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("user_address")%></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><%=rs.getString("city_name")%></td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td><%=rs.getString("user_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("user_email")%></td>
                </tr>
            </table>
                    <%
    }
                    %>
        </form>    
    </body>
</html>
