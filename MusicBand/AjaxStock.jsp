<%-- 
    Document   : AjaxStock
    Created on : Feb 23, 2020, 3:46:56 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>

<%
    String TrackId=request.getParameter("tid");
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <table border="1">
                <tr>
                    <td>
                        Stock
                    </td>
                    <td>
                        <input type="text" name="txtStock" id="txtStock">   
                        <input type="hidden" name="txtTrack" id="txtTrack" value="<%=TrackId %>">  
                        
                    </td> 
                    <td colspan="2">
                        <input type="submit" name="btnSubmit" id="btnSubmit" value="Add Stock">
                    </td>
                </tr>
            </table>
            
        </form>
    </body>
</html>
