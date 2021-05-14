<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean> 

    <html>
        <head>
        <%@include file="Links.jsp" %>
        </head>
        <body>
            <%@include file="Header.jsp" %>
            <form>
   
<%
    if(request.getParameter("bid")!=null)
    {
        String up="update tbl_bandmemberbook set bmb_pgstatus='1' where bmb_id='"+request.getParameter("bid")+"'";
        obj.executeCommand(up);
        out.print(up);
    }
    %>
    <h1>Pending List</h1>
<table border="1" align="center" cellpadding="10">
            <tr>
                <th>Sl.no</th>
                <th>District</th>
                <th>Location</th>
                <th>Address</th>
                <th>Send Date</th>
                <th>Booking Date</th>
                <th>Booking Time</th>
                <th>Facilities</th>
                <th>Request By</th>
                <th>Action</th>
            </tr>
            <%
             String sel="select * from tbl_bandmemberbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where bandmember_id='"+session.getAttribute("memberid")+"' and  bmb_pgstatus='0'";
             ResultSet rs=obj.selectCommand(sel);
             int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("bmb_location")%></td>
                <td><%=rs.getString("bmb_address")%></td>
                <td><%=rs.getString("bmb_curdate")%></td>
                <td><%=rs.getString("bmb_date")%></td>
                <td><%=rs.getString("bmb_time")%></td>
                <td><%=rs.getString("bmb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs.getString("user_id")%>"><%=rs.getString("user_name")%></a></td>
                <td><a href="ViewBookingRequest.jsp?bid=<%=rs.getString("bmb_id")%>">Add To Program List</a></td>
                <td><a href="#">Reject</a></td>
                
                
            </tr>
            <%
                        }
            %>
            
        </table>
            <br>
            <br>
            <br>
            <br>
             <h1>Accepted List</h1>
<table border="1" align="center" cellpadding="10">
            <tr>
                <th>Sl.no</th>
                <th>District</th>
                <th>Location</th>
                <th>Address</th>
                <th>Send Date</th>
                <th>Booking Date</th>
                <th>Booking Time</th>
                <th>Facilities</th>
                <th>Request By</th>
                <th>Action</th>
            </tr>
            <%
             String sel1="select * from tbl_bandmemberbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where bandmember_id='"+session.getAttribute("memberid")+"' and  bmb_pgstatus='1'";
            out.print(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int j=0;
            while(rs1.next())
            {
               j ++;
                        %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("bmb_location")%></td>
                <td><%=rs1.getString("bmb_address")%></td>
                <td><%=rs1.getString("bmb_curdate")%></td>
                <td><%=rs1.getString("bmb_date")%></td>
                <td><%=rs1.getString("bmb_time")%></td>
                <td><%=rs1.getString("bmb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs1.getString("user_id")%>"><%=rs1.getString("user_name")%></a></td>
               
                <td><a href="#">Completed</a></td>
                
                
            </tr>
            <%
                        }
            %>
            
        </table>
            </form>
            <%@include file="Footer.jsp" %>
        </body>
             </html>