<%-- 
    Document   : AlbumLaunch
    Created on : 18 Feb, 2020, 10:41:33 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Album Launch</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post" enctype="multipart/form-data" action="AlbumUpload.jsp">
            <table  class="table">
            <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required" autofocus="autofocus"></td>
            </tr>
            <tr>
                    <td>Date</td>
                    <td><input type="date" name="txtdate" id="txtdate" required="required"></td>
            </tr>
            <tr>
                    <td>Time</td>
                    <td><input type="time" name="txttime" id="txttime" required="required"></td>
            </tr>
            <tr>
                <td>Location</td>
                <td><input type="text" name="txtloc" id="txtloc" required="required"</td>
            </tr>
            <tr>
                    <td>Poster</td>
                    <td><input type="file" name="filephoto" id="filephoto" required="required"></td>
            </tr>
            <tr>
                    <td>Description</td>
                    <td><input type="text" name="txtdesc" id="txtdesc" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" class="btn btn-primary mt-2 mt-xl-0" id="btncancel" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0"></td>
            </tr>
            </table>
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
