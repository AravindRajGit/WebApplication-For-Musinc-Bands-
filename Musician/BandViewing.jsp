<%-- 
    Document   : UserBandGallery
    Created on : 27 Dec, 2019, 2:40:52 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>

<%
    String bandid="";
    String Membid="";  
    Membid=session.getAttribute("mStatus").toString();
    if(request.getParameter("reqid")!=null)
        {
            bandid=request.getParameter("reqid");
            String ins="insert into tbl_request(musician_id,band_id,request_date)values('"+session.getAttribute("musicianid")+"','"+bandid+"',curdate())";
            obj.executeCommand(ins);
            //out.print(ins);
            %>
            <script>
                alert('Your Request Successfully Send ,Wait For Responce!!')
            </script>
            <%
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MusicianViewBand</title>
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
        <br>
        <br>
        <br>
        <br>
        <br>
    <center>
          <table  align="center" cellpadding="10">
        <%
        String sel="select * from tbl_musicband";
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
            <p><img src="../MusicBand/Logo/<%=rs.getString("band_logo")%>" width="150" height="150"></p>
            <p>Name : <%=rs.getString("band_name")%></p>
            <p>Contact : <%=rs.getString("band_contact")%></p>
            <p>Email : <%=rs.getString("band_email")%></p>
            <%
            if(Membid.equals("0")||Membid.equals("2")){
            %>
            <p><a href="BandViewing.jsp?reqid=<%=rs.getString("band_id")%>">Send Request</a></p>
            <%
            }
            %>
            
             <p><a href="BandMembers.jsp?bandid=<%=rs.getString("band_id")%>">Gems</a></p>
              <p><a href="ViewBGallery.jsp?bandid=<%=rs.getString("band_id")%>">Gallery</a></p>
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
        <br>
        <br>
        <br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
