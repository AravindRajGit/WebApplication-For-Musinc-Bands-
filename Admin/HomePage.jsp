<%-- 
    Document   : HomePage
    Created on : 9 Dec, 2019, 1:56:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String username="";
username=session.getAttribute("adminname").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
    </head>
    <body>
        <h1 align="center">Welcome <%=username%></h1>
        <a href="MusicBandList-New.jsp">Band New List</a>
        <a href="MusicBandList-Accepted.jsp">Accepted Bands</a>
        <a href="MusicBandList-Rejected.jsp">Rejected Bands</a>
        <a href="ViewFeedback.jsp">View Feedbacks</a>
    </body>
</html>
