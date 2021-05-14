<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean> 

    <html>
        <head>
        <%@include file="Links.jsp" %>
        </head>
<%
    if(request.getParameter("bbid")!=null)
    {
        String up="update tbl_bandbook set bb_pgstatus='1' where bb_id='"+request.getParameter("bbid")+"'";
        obj.executeCommand(up);
        out.print(up);
    }
    
     if(request.getParameter("rejid")!=null)
    {
        String del="delete from  tbl_bandbook  where bb_id='"+request.getParameter("rejid")+"'";
        obj.executeCommand(del);
        //out.print(del);
    }
      if(request.getParameter("com")!=null)
    {
        String up1="update tbl_bandbook set bb_cstatus='1' where bb_id='"+request.getParameter("com")+"'";
        obj.executeCommand(up1);
        //out.print(up1);
    }
     
    %>
    <body>
        <form>
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
                <th>District</th>
                <th>Location</th>
                <th>Address</th>
                <th>Send Date</th>
                <th> Date</th>
                <th> Time</th>
                <th>Facilities</th>
                <th>Request By</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel="select * from tbl_bandbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where band_id='"+session.getAttribute("bandid")+"' and  bb_pgstatus='0' and bb_cstatus='0'";
           //  out.print(sel);
             ResultSet rs=obj.selectCommand(sel);
             int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("bb_location")%></td>
                <td><%=rs.getString("bb_address")%></td>
                <td><%=rs.getString("bb_curdate")%></td>
                <td><%=rs.getString("bb_date")%></td>
                <td><%=rs.getString("bb_time")%></td>
                <td><%=rs.getString("bb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs.getString("user_id")%>"><%=rs.getString("user_name")%></a></td>
                <td><a href="ViewBookingRequest.jsp?bbid=<%=rs.getString("bb_id")%>">Add To Program List</a></td>
                <td><a href="ViewBookingRequest.jsp?rejid=<%=rs.getString("bb_id")%>">Reject</a></td>
                
                
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
            
            <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Accepted List</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
            <tr>
                <th>Sl.no</th>
                <th>District</th>
                <th>Location</th>
                <th>Address</th>
                <th>Send Date</th>
                <th> Date</th>
                <th> Time</th>
                <th>Facilities</th>
                <th>Request By</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel1="select * from tbl_bandbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where band_id='"+session.getAttribute("bandid")+"' and  bb_pgstatus='1' and c_status='0'";
            //out.print(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int j=0;
            while(rs1.next())
            {
               j ++;
                        %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("bb_location")%></td>
                <td><%=rs1.getString("bb_address")%></td>
                <td><%=rs1.getString("bb_curdate")%></td>
                <td><%=rs1.getString("bb_date")%></td>
                <td><%=rs1.getString("bb_time")%></td>
                <td><%=rs1.getString("bb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs1.getString("user_id")%>"><%=rs1.getString("user_name")%></a></td>
               
                <td><a href="ViewBookingRequest.jsp?com=<%=rs1.getString("bb_id")%>">Completed</a></td>
                
                
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
                      
            <%@include file="Footer.jsp" %>
    </body>
    </html>