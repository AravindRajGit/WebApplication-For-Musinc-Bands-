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
        <title>Complaint</title>
        <%@include file="Links.jsp" %>
         <style> 
            table, th, td { 
                border: 2px solid ; 
/*                text-align:center; */
            } 
            th, td { 
                padding: 20px; 
                background-color:none; 
            } 
              
            h1 { 
            color:#000; 
            } 
        </style> 
    </head>
     <body>
           <%@include file="Header.jsp" %>
    <%
    String musicianid="";
    musicianid=session.getAttribute("musicianid").toString();
    String sel="select * from tbl_musician m inner join tbl_city d on d.city_id=m.city_id inner join tbl_artist ar on ar.artist_id=m.artist_id inner join tbl_artistsubtype at on at.artsub_id=m.artsub_id where musician_id='"+musicianid+"'";
//    sout.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
    %>
   
      
        <br>
        <br>
        <br>
        <br>
        <br>
        <form method="post">
            <center>
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td colspan="2"><div align="center"><img src="Photo/<%=rs.getString("musician_photo")%>" width="150" height="150"></div></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("musician_name")%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=rs.getString("musician_gender")%></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><%=rs.getString("musician_dob")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("musician_address")%></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><%=rs.getString("city_name")%></td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td><%=rs.getString("musician_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("musician_email")%></td>
                </tr>
                <tr>
                    <td>Artist Type</td>
                    <td><%=rs.getString("artist_name")%></td>
                </tr>
                <tr>
                    <td>ArtistSub Type</td>
                    <td><%=rs.getString("artsub_name")%></td>
                </tr>
            </table>
            </center>
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
