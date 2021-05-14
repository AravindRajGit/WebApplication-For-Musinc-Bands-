<%-- 
    Document   : Event
    Created on : 27 Dec, 2019, 3:12:49 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String ename="",edate="",etime="",eduration="",eseats="",erate="",ecity="",egenre="";
if(request.getParameter("btnsubmit")!=null)
{
    ename=request.getParameter("txtname");
    edate=request.getParameter("txtdate");
    etime=request.getParameter("txttime");
    eduration=request.getParameter("txtduration");
    eseats=request.getParameter("txtseat");
    erate=request.getParameter("txtrate");
    ecity=request.getParameter("slctcity");
    egenre=request.getParameter("slctgenre");
    String ins="insert into tbl_event(event_name,band_id,event_date,event_time,event_duration,city_id,genre_id,event_seats,event_rate) values('"+ename+"','"+session.getAttribute("bandid")+"','"+edate+"','"+etime+"','"+eduration+"','"+ecity+"','"+egenre+"','"+eseats+"','"+erate+"')";
    boolean status=obj.executeCommand(ins);
    if(status==true)
    {
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='Event.jsp'},40);//40millisecend it go to next page
        </script>
     <%
    }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
                <tr>
                    <td>Event Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required"></td>
                </tr> 
                <tr>
                    <td>Date</td>
                    <td><input type="date" name="txtdate" id="txtdate" required="required"></td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="time" name="txttime" id="txttime" required="required"></td>
                </tr>
                <tr>
                    <td>Duration</td>
                    <td><input type="text" name="txtduration" id="txtduration" required="required">(Hour)</td>
                </tr>
                <tr>
                    <td>No: of Seats</td>
                    <td><input type="text" name="txtseat" id="txtseat" required="required"></td>
                </tr>
                <tr>
                    <td>Rate</td>
                    <td><input type="text" name="txtrate" id="txtrate" required="required"></td>
                </tr>
                <tr>
                <td>City</td>
                <td><select name="slctcity"id="slctcity" required="required">
                <option value="--select--">--Select--</option>
                <%
                String sele="select * from tbl_city";
                ResultSet rse=obj.selectCommand(sele);
                while(rse.next())
                { 
                %>
                <option value="<%=rse.getString("city_id")%>"><%=rse.getString("city_name")%></option>
                <%
                }
                %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Genre</td>
                <td><select name="slctgenre"id="slctgenre" required="required">
                <option value="--select--">--Select--</option>
                <%
                String select="select * from tbl_genre";
                ResultSet rse1=obj.selectCommand(select);
                while(rse1.next())
                { 
                %>
                <option value="<%=rse1.getString("genre_id")%>"><%=rse1.getString("genre_name")%></option>
                <%
                }
                %>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" class="btn btn-primary mt-2 mt-xl-0" id="btncancel" value="Cancel">
                    <input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-primary mt-2 mt-xl-0" value="Submit"></td>
            </tr>
            </table>    
        </form>
                    <br>
                    <br>
                    <br>
                <%@include file="Footer.jsp" %>
    </body>
</html>
