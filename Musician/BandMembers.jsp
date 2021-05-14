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
        <title>BandMember</title>
    <%@include file="Links.jsp" %>
     <style> 
            table, th, td { 
                border: 2px solid ; 
                text-align:center; 
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
    <center>
          <table  align="center" cellpadding="10">
        <%
        String sel1="select * from tbl_bandmember bm  inner join tbl_city ci on bm.city_id=ci.city_id inner join tbl_district dis on ci.district_id=dis.district_id inner join tbl_artistsubtype asub on bm.artsub_id=asub.artsub_id inner join tbl_artist ar on ar.artist_id=asub.artist_id where band_id='"+request.getParameter("bandid")+"'";
             System.out.println(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int i=0;
            while(rs1.next())
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
                <p><img src="Photo/<%=rs1.getString("bandmember_photo")%>" width="150" height="150"></p>
                <p>Name           :<%=rs1.getString("bandmember_name")%></p>
                <p>Gender         :<%=rs1.getString("bandmember_gender")%></p>
                <p>Date of Birth  :<%=rs1.getString("bandmember_dob")%></p>
                <p>Address        :<%=rs1.getString("bandmember_address")%></p>
                <p>District       :<%=rs1.getString("district_name")%></p>
                <p>City           :<%=rs1.getString("city_name")%></p>
                <p>Contact        :<%=rs1.getString("bandmember_contact")%></p>
                <p>Email          :<%=rs1.getString("bandmember_email")%></p>
                <p>Artist         :<%=rs1.getString("artist_name")%></p>
                <p>Artist SubType :<%=rs1.getString("artsub_name")%></p>
                
            </td>
        <%
            if(i==5)
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
