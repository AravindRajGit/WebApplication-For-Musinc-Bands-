<%-- 
    Document   : Feedback
    Created on : Feb 23, 2020, 2:31:02 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean><!DOCTYPE html>
<%
String caption="",content="";
if(request.getParameter("btnsave")!=null)
   {
       caption=request.getParameter("txtcaption");
       content=request.getParameter("txtcontent");
       String ins="insert into tbl_feedback(feedback_caption,feedback_content,user_id)values('"+caption+"','"+content+"','"+session.getAttribute("userid")+"')";
       obj.executeCommand(ins);
       System.out.println(ins);
   }
       
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracks</title>
         <style>
        table, th, td {
/*            border:0px solid;
            text-align: center;*/
        }
        th,td {
            padding: 20px;
            background-color: none;
        }
        h1 {
           color: #000 ;
        }
        </style>
            <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <form method="post">
            <center>
        <table width="200" align="center" border="1" cellpadding="10">
      <tr>
                  
            <td>Caption</td>
            <td><input type="text" name="txtcaption" id="txtcaption" autofocus="autofocus" /></td>
            </tr>
          <tr>
            <td>Content</td>
            <td><textarea name="txtcontent" id="txtcontent" cols="45" rows="5"></textarea></td>
            </tr>
          <tr>
            <td colspan="2"><div align="right">
              <input type="submit" name="btnsave" id="btnsave" value="Save" />
              <input type="reset" name="btncancel" id="btncancel" value="Cancel" />
              </div></td>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
