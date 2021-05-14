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
    <center>
          <table  align="center" cellpadding="10">
        <%
        String sel="select * from tbl_tracks t inner join tbl_musicband m on m.band_id=t.band_id inner join tbl_genre g on g.genre_id=t.genre_id";
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
            <p><img src="../MusicBand/TrackPhoto/<%=rs.getString("track_photo")%>" width="80" height="80"></p>
            <p>Track : <%=rs.getString("track_name")%></p>
            <p>Band : <%=rs.getString("band_name")%></p>
            <p>Genre : <%=rs.getString("genre_name")%></p>
            <p>Description : <%=rs.getString("track_detail")%></p>
            <p>Price : <%=rs.getString("track_price")%></p>
            <p>Stock : <%=rs.getString("track_stock")%></p>
            <p><a href="TrackBuy.jsp?tid=<%=rs.getString("track_id") %>">Buy Now</a></p>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
