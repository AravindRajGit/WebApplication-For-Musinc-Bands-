<%-- 
    Document   : EventSchedule
    Created on : 23 Jan, 2020, 2:38:19 PM
    Autdor     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type">
        
        
        
        <script src="../Admin/JQ/jq.js"></script>

    <script>
       
    $(document).ready(function(){
          
            $("input[type='radio']").change(function(){
             
                if($(this).val()=="Yes"){

                    $("#rateLabel").show();
                    $("#countLabel").show();

                    $("#txtrate").show();
                    $("#txtcount").show();


              }
              else{
                  
                   $("#rateLabel").hide();
                   $("#countLabel").hide();

                   $("#txtrate").hide();
                   $("#txtcount").hide();

              }
           
          });
         
        });
        </script>

        <title>Event Schedule</title>
    <%@include file="Links.jsp" %>
        
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form metdod="post" enctype="multipart/form-data" action="EventBannerUpload.jsp">
            <table class="table">
            <tr>
                    <td>Event Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required" autofocus="autofocus"></td>
            </tr>
            <tr>
                <td>District</td>
                <td><select name="slctdistrict"id="slctdistrict" required="required">
                <option value="--select--">--Select--</option>
                <%
                String sele="select * from tbl_district";
                ResultSet rse=obj.selectCommand(sele);
                while(rse.next())
                { 
                %>
                <option value="<%=rse.getString("district_id")%>"><%=rse.getString("district_name")%></option>
                <%
                }
                %>
                    </select>
                </td>
            </tr>
            <tr>
                    <td>Location</td>
                    <td><input type="text" name="txtlocation" id="txtlocation" required="required"></td>
            </tr>
            <tr>
                    <td>Location Address</td>
                    <td><textarea name="txtaddress" id="txtaddress" rows="5" cols="20" required="required"></textarea></td>
            </tr>
            
            
            <tr>
                    <td>Ticket</td>
                    <td><input type="radio" name="rdbticket" id="rdbticket" value="Yes" onchange="getrate(this.value)">Yes
                        <input type="radio" name="rdbticket" id="rdbticket" value="No">No
                    </td>
            </tr>
            
            <!------------------------>
            <tr style="display:none;" id="rateLabel" name="rateLabel">
                <td>Ticket Rate</td>
                <td><input type="text" style="display:none;"  name="txtrate" id="txtrate" onchange="getcount(this.value)" ></td>
            </tr>
            
            
            <tr style="display:none;" id="countLabel" name="countLabel">
                <td>Ticket Count</td>
                <td><input type="text" style="display:none;"  name="txtcount" id="txtcount" ></td>
            </tr>
            
            <!----------------------->
          
            
            <tr>
                    <td>Date</td>
                    <td><input type="date" name="txtdate" id="txtdate" required="required"></td>
            </tr>
            <tr>
                <td>Time</td>
                <td>
                    <input type="time" name="txttime" id="txttime" required="required">
                </td>
            </tr>
            <tr>
                    <td>Details</td>
                    <td><input type="file" name="filedetails" id="filedetails" required="required"></td>
            </tr>
            <tr>
                    <td>Banner</td>
                    <td><input type="file" name="filebanner" id="filebanner" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" align="right"> <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0">
                            <input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0"></td>
            </tr>
            </table>
        </form>
                    <table border="1" align="center" cellpadding="10">
                        <tr>
                            <td>Sl.no</td>
                            <td>Event</td>
                            <td>Name</td>
                            <td>District</td>
                            <td>Location</td>
                            <td>Address</td>
                            <td>Ticket</td>
                            <td>Date</td>
                            <td>Time</td>
                            <td>Details</td>
                            <td> Rate</td>
                            <td> Count</td>
                        </tr>
        <%
        String sel="select * from tbl_bandevents be inner join tbl_district d on d.district_id=be.district_id where band_id='"+session.getAttribute("bandid")+"'";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
            i++;
            %>
        <tr>
            <td><%=i%></td>
            <td><img src="EventBanner/<%=rs.getString("bevent_banner")%>" width="80xp" height="80xp"></td>
            <td><%=rs.getString("bevent_name")%></td>
            <td><%=rs.getString("district_name")%></td>
            <td><%=rs.getString("bevent_location")%></td>
            <td><%=rs.getString("bevent_locaddress")%></td>
            <td><%=rs.getString("bevent_ticketstatus")%></td>
            <td><%=rs.getString("bevent_date")%></td>
            <td><%=rs.getString("bevent_time")%></td>
            <td><a href="EventDetails/<%=rs.getString("bevent_details")%>" download>Download</a></td>
            
            <td><%=rs.getString("bevent_ticketrate")%></td>
            <td><%=rs.getString("bevent_ticketcount")%></td>
        </tr>
            
    <%       
        }
        %>
            </table>
            <br>
            <br>
            <br>
            <br>
            <br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
