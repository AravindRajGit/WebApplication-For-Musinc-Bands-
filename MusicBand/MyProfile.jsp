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
        <title>Band My Profile</title>
    <%@include file="Links.jsp" %>
    </head>
    <%
    String bandid="";
    bandid=session.getAttribute("bandid").toString();
    String sel="select * from tbl_musicband u inner join tbl_district p on p.district_id=u.district_id where band_id='"+bandid+"'";
    System.out.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
    %>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
                <tr>
                    <td colspan="2"><div align="center"><img src="Logo/<%=rs.getString("band_logo")%>" width="150xp" height="150xp"></div></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("band_name")%></td>
                </tr>
                <tr>
                    <td>Year of Origin</td>
                    <td><%=rs.getString("band_year")%></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><%=rs.getString("district_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("band_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("band_email")%></td>
                </tr>
                <tr>
                    <td>No:of Band Members</td>
                    <td><%=rs.getString("band_membersnum")%></td>
                </tr>
            </table>
                    <%
    }
                    %>
        </form>   
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
        <br>
        <br>
        <br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
