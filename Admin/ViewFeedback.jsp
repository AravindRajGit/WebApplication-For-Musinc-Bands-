<%-- 
    Document   : ViewFeedback
    Created on : Feb 23, 2020, 3:22:03 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">District Entry</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
                      
                     
            <tr>
                <th>Caption</th>
                <th>Content</th>
                <th>Feedback By</th>
            </tr>
                      </thead>
                      <tbody>
        <%
        String sel="select * from tbl_feedback t inner join tbl_user m on m.user_id=t.user_id";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
          
        %>
       
        
        <td>
            <%=rs.getString("feedback_caption")%></td>
            <td><%=rs.getString("feedback_content")%></td>
            <td><%=rs.getString("user_name")%></td>
            
        </td>
         
    </tr>
    <%
           
        }
        %>
            </tbody>
        </table>
                         </div>
                </div>
              </div>
            </div>
          </div>
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
             <br>
            <br>
            <br>
            <br>
            <%@include file="Footer.jsp" %>
    </body>
</html>
