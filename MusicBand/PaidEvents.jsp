<%-- 
    Document   : EventSchedule
    Created on : 23 Jan, 2020, 2:38:19 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<html>
    <head> 
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
 <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Paid Events</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
                   
                        <tr>
                            <th>Sl.no</th>
                            <th>Event</th>
                            <th>Name</th>
                            <th>District</th>
                            <th>Location</th>
                            
                            <th>Ticket</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Details</th>
                            <th>Rate</th>
                            <th>Count</th>
                        </tr>
                      </thead>
                      <tbody>
        <%
        String sel="select * from tbl_bandevents be inner join tbl_district d on d.district_id=be.district_id where band_id='"+session.getAttribute("bandid")+"' and bevent_ticketstatus='Yes'";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
            i++;
            %>
        <tr>
            <td><%=i%></td>
            <td><img src="EventBanner/<%=rs.getString("bevent_banner")%>" width="150xp" height="150xp"></td>
            <td><%=rs.getString("bevent_name")%></td>
            <td><%=rs.getString("district_name")%></td>
            <td><%=rs.getString("bevent_location")%></td>
            <td><%=rs.getString("bevent_locaddress")%></td>
            <td><%=rs.getString("bevent_ticketstatus")%></td>
            <td><%=rs.getString("bevent_date")%></td>
            <td><%=rs.getString("bevent_time")%></td>
            
            <td><%=rs.getString("bevent_ticketrate")%></td>
            <td><%=rs.getString("bevent_ticketcount")%></td>
<!--            <td><a href="#">BookingDetails</a></td>-->
        </tr>
            
    <%       
        }
        %></tbody>
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
