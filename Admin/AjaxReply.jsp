<%-- 
    Document   : AjaxReply
    Created on : 18 Feb, 2020, 3:32:41 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
    String cid=request.getParameter("cid");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax Reply</title>
    </head>
    <body>
        <h1 align="center">Reply</h1>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
            <td>
                <input type="hidden" name="txthid" id="txthid" value="<%= cid %>">
                <textarea name="txtReplay" id="txtReplay" rows="5" cols="20" required="required"></textarea>
            </td>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"</td>
            </tr>
    </body>
</html>
