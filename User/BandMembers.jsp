<%-- 
    Document   : UserBandGallery
    Created on : 27 Dec, 2019, 2:40:52 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Band Members</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
          <table  align="center" cellpadding="10">
        <%
        String sel="select * from tbl_bandmember bm  inner join tbl_city ci on bm.city_id=ci.city_id inner join tbl_district dis on ci.district_id=dis.district_id inner join tbl_artistsubtype asub on bm.artsub_id=asub.artsub_id inner join tbl_artist ar on ar.artist_id=asub.artist_id where band_id='"+request.getParameter("bandid")+"'";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
            i++;
            if(i==1)
            {
            %>
             <tr>
                 <%
                }
        %>
       
        <td>
            <p><img src="../Musician/Photo/<%=rs.getString("bandmember_photo")%>" width="150xp" height="150xp"></p>
            <p>Name : <%=rs.getString("bandmember_name")%></p>
            <p>Contact : <%=rs.getString("bandmember_contact")%></p>
            <p>Email : <%=rs.getString("bandmember_email")%></p>
            <p><a href="BandBook.jsp">Book Now</a></p>
             <p><a href="BandMembers.jsp">Gems</a></p>
              <p><a href="BandGallery.jsp">Gallery</a></p>
        </td>
            <%
            if(i==4)
        {
        %> 
        
    </tr>
    <%
            i=0;
           }
        }
        %>
            </table>
        <%@include file="Footer.jsp" %>
    </body>
</html>
