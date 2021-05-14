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
        <title> Member My Profile</title>
    <%@include file="Links.jsp" %>
    </head>
    <%
    String userid="";
    userid=session.getAttribute("memberid").toString();
    String sel="select * from tbl_bandmember bm inner join tbl_city c on c.city_id=bm.city_id inner join tbl_musicband mb on mb.band_id=bm.band_id inner join tbl_artistsubtype at on at.artsub_id=bm.artsub_id inner join tbl_artist ar on ar.artist_id=at.artist_id where bandmember_id='"+userid+"'";
    System.out.println(sel);
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
    %>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table border="0" align="center" cellpadding="10">
                <tr>
                    <td colspan="2"><div align="center"><img src="../Musician/Photo/<%=rs.getString("bandmember_photo")%>" width="150xp" height="150xp"></div></td>
                </tr>
                
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("bandmember_name")%></td>
                </tr>
                
                <tr>
                    <td>Gender</td>
                    <td><%=rs.getString("bandmember_gender")%></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><%=rs.getString("bandmember_dob")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("bandmember_address")%></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><%=rs.getString("city_name")%></td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td><%=rs.getString("bandmember_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("bandmember_email")%></td>
                </tr>
                <tr>
                    <td>Artist Type</td>
                    <td><%=rs.getString("artist_name")%></td>
                </tr>
                <tr>
                    <td>Artist Subtype</td>
                    <td><%=rs.getString("artsub_name")%></td>
                </tr>
                <tr>
                    <td>Band</td>
                    <td><%=rs.getString("band_name")%></td>
                </tr>
            </table>
                    <%
    }
                    %>
        </form>  
                    <%@include file="Footer.jsp" %>
    </body>
</html>
