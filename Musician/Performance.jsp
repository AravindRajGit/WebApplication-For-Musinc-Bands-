<%-- 
    Document   : BandGallery
    Created on : 27 Dec, 2019, 2:00:23 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MusicianViewBand</title>
        <%@include file="Links.jsp" %>
         <style> 
            table, th, td { 
/*                border: 2px solid ; 
                text-align:center; */
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
            <form method="post" enctype="multipart/form-data" action="PerformanceUpload.jsp">
                <center>
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <td>File</td>
                    <td><input type="file" name="filevideo" id="filevideo" required="required"></td>
                </tr>
                <tr>
                    <td>Caption</td>
                    <td><textarea name="txtdesc" id="txtdesc" rows="5" cols="20" required="required"></textarea></td>
                </tr>
                <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"></td>
                </tr>
            </table>
                </center>
     
        <br/>
        <table border="0" align="center" cellpadding="10">
         <%
        String sel="select * from tbl_musicianperformance where musician_id='"+session.getAttribute("musicianid")+"'";
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
            <p>
                <video width="320" height="240" controls >
  			<source src="../Musician/Performance Video/<%=rs.getString("performance_file")%>" type="video/mp4">
  			<source src="movie.ogg" type="video/ogg">
  				Your browser does not support the video tag.
  		</video>
            </p>
            
            <p><%=rs.getString("performance_caption")%></p>
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
