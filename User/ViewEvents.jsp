<%-- 
    Document   : ViewEvents
    Created on : 27 Jan, 2020, 12:24:42 PM
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
        String sel="select * from tbl_bandevents be inner join tbl_district d on d.district_id=be.district_id inner join tbl_musicband mb on mb.band_id=be.band_id";
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
            <p><img src="../MusicBand/EventBanner/<%=rs.getString("bevent_banner")%>" width="150" height="150"></p>
            <p>Event: <%=rs.getString("bevent_name")%></p>
            <p>Band : <%=rs.getString("band_name")%></p>
            <% 
            if(rs.getString("bevent_ticketstatus").equals("No"))
            {
            %>
        
         <p>Free</p>
            <%
            } 
            else
            {
            %>
            
            
            <p>Paid</p>
            
            <%
            }
            %>
            
            <p><a href="EventViewMore.jsp?eventid=<%=rs.getString("bevent_id")%>">View More</a></p>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
