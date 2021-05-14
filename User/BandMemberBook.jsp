<%-- 
    Document   : BandBook
    Created on : 17 Feb, 2020, 10:33:31 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
   String district="",location="",address="",date="",time="",facilities="";
   String memberid=request.getParameter("memberid");
   String userid="";
   if(request.getParameter("btnsubmit")!=null)
   {
       district=request.getParameter("slctdistrict");
       location=request.getParameter("txtloc");
       address=request.getParameter("txtaddress");
       date=request.getParameter("txtdate");
       time=request.getParameter("txttime");
       facilities=request.getParameter("txtfacilities");
       String ins="insert into tbl_bandmemberbook(district_id,bmb_location,bmb_address,bmb_date,bmb_time,bmb_facilities,user_id,bandmember_id,bmb_curdate) values('"+district+"','"+location+"','"+address+"','"+date+"','"+time+"','"+facilities+"','"+session.getAttribute("userid")+"','"+memberid+"',curdate())";
      obj.executeCommand(ins);
      System.out.println(ins);
      out.print(ins);
   }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BandMember Book</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
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
                    <td><input type="text" name="txtloc" id="txtloc" required="required"></td>
            </tr>
            <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" id="txtaddress" rows="5" cols="20" required="required"></textarea></td>
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
                <td>Facilities</td>
                <td><textarea name="txtfacilities" id="txtfacilities" rows="5" cols="20" required="required"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"</td>
            </tr>
            </table>
        </form>
                <%@include file="Footer.jsp" %>
    </body>
</html>
