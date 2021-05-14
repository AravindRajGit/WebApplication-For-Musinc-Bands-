<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean> 


<%
    if(request.getParameter("bid")!=null)
    {
        String up="update tbl_musicianbook set mb_pgstatus='1' where mb_id='"+request.getParameter("bid")+"'";
        obj.executeCommand(up);
        out.print(up);
    }
    %>
    <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MusicianViewBand</title>
        <%@include file="Links.jsp" %>
         <style> 
            table, th, td { 
/*                border: 2px solid ; 
                text-align:center; */
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
        
         <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <center>
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
             String sel="select * from tbl_musicianbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where musician_id='"+session.getAttribute("musicianid")+"' and  mb_pgstatus='0'";
             ResultSet rs=obj.selectCommand(sel);
             int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("mb_location")%></td>
                <td><%=rs.getString("mb_address")%></td>
                <td><%=rs.getString("mb_curdate")%></td>
                <td><%=rs.getString("mb_date")%></td>
                <td><%=rs.getString("mb_time")%></td>
                <td><%=rs.getString("mb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs.getString("user_id")%>"><%=rs.getString("user_name")%></a></td>
                <td><a href="ViewBookingRequest.jsp?bid=<%=rs.getString("mb_id")%>">Add To Program List</a></td>
                <td><a href="#">Reject</a></td>
                
                
            </tr>
            <%
                        }
            %>
            
        </table>
        </center>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <center>
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
             String sel1="select * from tbl_musicianbook b inner join tbl_district dis on b.district_id=dis.district_id inner join tbl_user usr on b.user_id=usr.user_id where musician_id='"+session.getAttribute("musicianid")+"' and  mb_pgstatus='1'";
           // out.print(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int j=0;
            while(rs1.next())
            {
               j ++;
                        %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("mb_location")%></td>
                <td><%=rs1.getString("mb_address")%></td>
                <td><%=rs1.getString("mb_curdate")%></td>
                <td><%=rs1.getString("mb_date")%></td>
                <td><%=rs1.getString("mb_time")%></td>
                <td><%=rs1.getString("mb_facilities")%></td>
                <td><a href="RequestProfile.jsp?id=<%=rs1.getString("user_id")%>"><%=rs1.getString("user_name")%></a></td>
               
                <td><a href="ViewBookingRequest.jsp?com=<%=rs1.getString("mb_id")%>">Completed</a></td>
                
                
            </tr>
            <%
                        }
            %>
            
        </table>
            </center>
            
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
        <br>
        <br>
         <br>
        <br>
        <br>
            <%@include  file="Footer.jsp" %>
        </body>
    </html>