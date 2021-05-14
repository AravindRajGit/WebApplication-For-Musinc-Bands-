<%-- 
    Document   : ViewMusicianPerformance
    Created on : 7 Jan, 2020, 6:41:52 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>M Performance</title>
    </head>
    <body>
        <h1 align="center">Performance Gallery</h1>
        <table border="0" align="center" cellpadding="10">
         <%
        String sel="select * from tbl_musicianperformance where musician_id='"+request.getParameter("mid")+"'";
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
  			<source src="../Musician/Performance Video/<%=rs.getString("performance_file")%>" width="150xp" height="150xp" type="video/mp4">
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
    </body>
</html>
