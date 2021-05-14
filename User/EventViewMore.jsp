<%-- 
    Document   : EventViewMore
    Created on : 27 Jan, 2020, 2:57:31 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    
    String eventid="";
    String tck="";
    eventid=request.getParameter("eventid");

    if(request.getParameter("btnpay")!=null)
        {
          
            
            
            
            
                String trate="";
                int bookedTickets=0,soldTicket=0,balanceTicket=0,totalTickets=0,currentBalance=0,upsoldTickets=0;
    
    
    
                String sel="select * from tbl_bandevents where bevent_id='"+eventid+"'";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {
    
                  
                        totalTickets=Integer.parseInt(request.getParameter("txtCount"));//Total Tickets
                        soldTicket=Integer.parseInt(rs.getString("bevent_ticketsold"));//Sold Tickets
                        balanceTicket=totalTickets-soldTicket;// From This Equation We Get Current Balance Ticket
                        
                        bookedTickets=Integer.parseInt(request.getParameter("txtCount"));//Booked Tickets
                        trate=request.getParameter("txtTrate");//Total Rate
                        currentBalance=balanceTicket-bookedTickets;

                
                
                        out.println("Total Tcikets"+totalTickets);
                        out.println("soldTickets"+soldTicket);
                        out.println("BookedTickets"+bookedTickets);
                
                
    
                            if(soldTicket==0)
                            {
                            
                                String up ="update tbl_bandevents set bevent_ticketsold='"+bookedTickets+"' where bevent_id='"+eventid+"'";
                                obj.executeCommand(up);
                            
                            }
                            
                            else
                            {
                                 upsoldTickets=soldTicket+bookedTickets;
                                 String up ="update tbl_bandevents set bevent_ticketsold='"+upsoldTickets+"' where bevent_id='"+eventid+"'";
                                 obj.executeCommand(up);
                            
                            
                            }
                            
                            
                            String ins="insert into tbl_beventbook(user_id,bevent_id,bev_booktime,bev_bookdate,bev_booktickets,bev_ticketsamount,bev_verify)values('"+session.getAttribute("userid")+"','"+eventid+"',CURTIME(),CURDATE(),'"+bookedTickets+"','"+trate+"','0')";
                            obj.executeCommand(ins);
                            out.print(ins);
                            response.sendRedirect("Payment/Payment.jsp");
                
    
                
                
               
                              
                     
                   
        
                }
        
        
        }
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event View More</title>
          <style>
        table, th, td {
            border:2px solid;
            text-align: center;
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
            
 <script>
        num=1
        function fnAdd()
        {
           
           num++;
           count= parseInt(document.getElementById("txtCount").value=num);
           rate=document.getElementById("txtrate").value
           Trate=count*rate
           document.getElementById("txtTrate").value=Trate
       }
        
        function fnMinus(){
         
           num--;
           
           
           count= parseInt(document.getElementById("txtCount").value=num);
           rate=document.getElementById("txtrate").value
           Trate=count*rate
           document.getElementById("txtTrate").value=Trate
           
           
	}
</script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
    <br>
            <br>
            <br>
            <br>
        <form method="post">
            <center>
        <table  align="center" >
      <%
                
        
    
        int RemainingTickets=0;  
        String sel="select * from tbl_bandevents be inner join tbl_district d on d.district_id=be.district_id where bevent_id='"+eventid+"'";
        ResultSet rs=obj.selectCommand(sel);
        if(rs.next())
        {
            if(rs.getString("bevent_ticketstatus").equals("Yes"))
            RemainingTickets=Integer.parseInt(rs.getString("bevent_ticketcount"))-Integer.parseInt(rs.getString("bevent_ticketsold"));
        
            
            
      %>
        <tr>
            <td>
            <p><img src="../MusicBand/EventBanner/<%=rs.getString("bevent_banner")%>" width="150" height="150"></p>
            <p>Event Name : <%=rs.getString("bevent_name")%></p>
            <p>District   : <%=rs.getString("district_name")%></p>
            <p>Location   : <%=rs.getString("bevent_location")%></p>
            <p>Location Address: <%=rs.getString("bevent_locaddress")%></p>
            <p>Date       : <%=rs.getString("bevent_date")%></p>
            <p>Time       : <%=rs.getString("bevent_time")%></p>
            <input type="hidden" name="txtrate" id="txtrate" value="<%=rs.getString("bevent_ticketrate")%>">
            
            <p>Details    : <a href="../MusicBand/EventDetails/<%=rs.getString("bevent_details")%>" download>Download</a></p>
            <p><b>Total Tickets:</b><%=rs.getString("bevent_ticketcount")%></p>
            <%
            if(RemainingTickets==0)
            {
            %>
            <p>No Ticket Left</p>
            <%
            }
            
            else
            {
            %>
            <p><b>Left Tickets:</b><% out.print(RemainingTickets);  %></p>
            
            
           <%
             }
            if(rs.getString("bevent_ticketstatus").equals("Yes") && RemainingTickets!=0)
            {
            %>
                 Book Tickets
             <hr>
                    <p>Rate: <%=rs.getString("bevent_ticketrate")%></p>
                    <input type="button" value="-" name="btnminus" id="btnminus" onclick="fnMinus()">&nbsp;&nbsp;&nbsp;<input type="number" name="txtCount" min="0"  id="txtCount" value="1">&nbsp;&nbsp;&nbsp;<input type="button" value="+" name="btnAdd" id="btnAdd" onclick="fnAdd()">
                    <p><input type="text" placeholder="Total Rate" name="txtTrate" id="txtTrate" value="<%=rs.getString("bevent_ticketrate")%>"></p>
                    <p><input type="submit" name="btnpay" id="btnpay" value="Pay Now"></p>
            <%
            }
            %>
            </td>
        </tr>
            
    <%       
        }
        %>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
