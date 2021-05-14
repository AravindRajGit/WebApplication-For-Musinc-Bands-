<%-- 
    Document   : Ajaxplace
    Created on : 3 Dec, 2019, 12:53:54 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax District</title>
    </head>
    <body>
        <% 
            String disid="";
            disid=request.getParameter("sid");
        %>
          <option value="--select--">--Select--</option>
                <%
                String sel1="select * from tbl_district where state_id='"+disid+"'";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                { 
                %>
                <option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%></option>
                <%
                }
                %>
    </body>
</html>
