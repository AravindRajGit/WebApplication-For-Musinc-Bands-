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
    String ins="insert into tbl_complaints(complaint_caption,complaint_desc,musician_id) values ('"+caption+"','"+description+"','"+session.getAttribute("musicianid")+"')";
    obj.executeCommand(ins);
    System.out.println(ins);
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <%@include file="Links.jsp" %>
         <style> 
            table, th, td { 
                border: 2px solid ; 
/*                text-align:center; */
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
        <br>
        <br>
        <br>
        <form method="post">
            <center>
            <table border="1" align="center" cellpadding="10">
            <tr>
                <td>Caption</td>
                <td><input type="text" name="txtcaption" id="txtcaption" autofocus="autofocus" required="required" /></td>
            </tr>    
            <tr>
                <td>Description</td>
                <td><textarea name="txtdesc" id="txtdesc"  required="required" cols="45" rows="5"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"></td>
            </tr>
            </table>
            </center>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
