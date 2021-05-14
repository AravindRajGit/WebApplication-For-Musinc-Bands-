<%-- 
    Document   : add_rating
    Created on : Feb 1, 2020, 11:16:31 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>




<%
    int Rating=0,id=0;
    Rating=Integer.parseInt(request.getParameter("rating"));
    id=Integer.parseInt(request.getParameter("id"));
if(Rating!=0 && id!=0) {

    String up="update tbl_musicband set band_rating='"+Rating+"' where band_id='"+id+"'";
    obj.executeCommand(up);
    
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
