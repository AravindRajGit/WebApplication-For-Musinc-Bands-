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
        <title>Band Gallery</title>
    <%@include  file="Links.jsp" %>
     <style> 
            table, th, td { 
                border: 2px solid ; 
                text-align:center; 
            } 
            th, td { 
                padding: 10px; 
                background-color:none; 
            } 
              
            h1 { 
            color:#000; 
            } 
        </style> 
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
        String sel="select * from tbl_bandgallery where band_id='"+request.getParameter("bandid")+"'";
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
        <p><img src="../MusicBand/BandGallery/<%=rs.getString("band_file")%>" width="150xp" height="150xp"></p>
        <p><%=rs.getString("band_desc")%></p>
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
