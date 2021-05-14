<%-- 
    Document   : MusicBandList-New
    Created on : 10 Dec, 2019, 11:06:38 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
    if(request.getParameter("aid")!=null)
    {
        String up="update tbl_musicband set band_status='1' where band_id='"+request.getParameter("aid")+"'";
        obj.executeCommand(up);
    }
    if(request.getParameter("rid")!=null)
    {
        String up="update tbl_musicband set band_status='2' where band_id='"+request.getParameter("rid")+"'";
        obj.executeCommand(up);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Band New List</title>
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
                <th>Sl.no</th>
                <th>Band Name</th>
                <th>Year of Origin</th>
                <th>District</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Logo</th>
                <th>Proof</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel="select * from tbl_musicband m inner join tbl_district d on d.district_id=m.district_id where m.band_status='0' ";
             ResultSet rs=obj.selectCommand(sel);
             int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("band_name")%></td>
                <td><%=rs.getString("band_year")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("band_contact")%></td>
                <td><%=rs.getString("band_email")%></td>
                <td><img src="../Music Band/Logo/<%=rs.getString("band_logo")%>" width="150xp" height="150xp"></td>
                <td><img src="../Music Band/Proof/<%=rs.getString("band_lproof")%>" width="150xp" height="150xp"></td>
                <td><a href="MusicBandList-New.jsp?aid=<%=rs.getString("band_id")%>">Accept</a>
                <a href="MusicBandList-New.jsp?rid=<%=rs.getString("band_id")%>">Reject</a></td>
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
                     
            <%@include file="Footer.jsp" %>
    </body>
</html>
