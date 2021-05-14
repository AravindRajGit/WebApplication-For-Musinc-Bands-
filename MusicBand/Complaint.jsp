<%-- 
    Document   : Complaint
    Created on : 18 Feb, 2020, 2:14:27 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
String caption="",description="";
if(request.getParameter("btnsubmit")!=null)
{
    caption=request.getParameter("txtcaption");
    description=request.getParameter("txtdesc");
    String ins="insert into tbl_complaints(complaint_caption,complaint_desc,band_id) values ('"+caption+"','"+description+"','"+session.getAttribute("bandid")+"')";
    obj.executeCommand(ins);
    System.out.println(ins);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
            <tr>
                <td>Caption</td>
                <td><input type="text" name="txtcaption" id="txtcaption" autofocus="autofocus" required="required" /></td>
            </tr>    
            <tr>
                <td>Description</td>
                <td><textarea name="txtdesc" id="txtdesc"  required="required" cols="45" rows="5"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" class="btn btn-primary mt-2 mt-xl-0" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-primary mt-2 mt-xl-0" value="Submit"</td>
            </tr>
            </table>
        </form>
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
