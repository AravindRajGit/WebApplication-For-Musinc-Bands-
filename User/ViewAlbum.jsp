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
        <title>Tracks</title>
         <style>
        table, th, td {
            border:0px solid;
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
    <body>
        <%@include file="Header.jsp" %>
         <br>
            <br>
            <br>
            <br>
            <br>
            <br>
    <center>
          <table  align="center" cellpadding="10">
        <%
        String sel="select * from tbl_album t inner join tbl_musicband m on m.band_id=t.band_id";
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
            <p><img src="../MusicBand/Album/<%=rs.getString("album_poster")%>" width="150" height="150"></p>
            <p><%=rs.getString("album_description")%></p>
            <p><%=rs.getString("album_name")%></p>
            <p><%=rs.getString("album_date")%></p>
            <p><%=rs.getString("album_time")%></p>
            <p><%=rs.getString("album_location")%></p>
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
    </center>
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
