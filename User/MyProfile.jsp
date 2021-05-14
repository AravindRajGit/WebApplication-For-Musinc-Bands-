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

    <style>
        table, th, td {
            border:2px solid;
            text-align: center;
        }
        th,td {
            padding: 20px;
            background-color: none;
        }
        h1 {
           color: #000 ;
        }
        </style>
            <%@include file="Links.jsp" %>
    </head>
    <%
    String userid="";
    userid=session.getAttribute("userid").toString();
    String sel="select * from tbl_user u inner join tbl_city p on p.city_id=u.city_id where user_id='"+userid+"'";
    System.out.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
    %>
    <body>
        <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <form method="post">
            <center>
            <table border="1" align="center" cellpadding="40">
                <tr>
                    <td colspan="2"><div align="center"><img src="../Guest/UserImages/<%=rs.getString("user_photo")%>" width="150" height="150"></div></td>
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
            </center>
                    <%
    }
                    %>
        </form>
                    <%@include file="Footer.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
    </body>
</html>
