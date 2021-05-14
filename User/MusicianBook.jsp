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
   String musicianid=request.getParameter("musicianid");
   String userid="";
   if(request.getParameter("btnsubmit")!=null)
   {
       district=request.getParameter("slctdistrict");
       location=request.getParameter("txtloc");
       address=request.getParameter("txtaddress");
       date=request.getParameter("txtdate");
       time=request.getParameter("txttime");
       facilities=request.getParameter("txtfacilities");
       String ins="insert into tbl_musicianbook(district_id,mb_location,mb_address,mb_date,mb_time,mb_facilities,mb_curdate,user_id,musician_id) values('"+district+"','"+location+"','"+address+"','"+date+"','"+time+"','"+facilities+"',curdate(),'"+session.getAttribute("userid")+"','"+musicianid+"')";
      obj.executeCommand(ins);
      System.out.println(ins);
      //out.print(ins);
      %>
      <script>
          alert('Booking Completed Please Wait Musician Responce with in Two Days')
      </script>
          
      
      <%
   }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Musician Book</title>
        <style> 
            table, th, td { 
                border: 2px solid ; 
                text-align:center; 
            } 
            th, td { 
                padding: 10px; 
                background-color:none; 
            } 
              
            h1 { 
            color:#000; 
            } 
        </style> 
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form method="post">
            <center>
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
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"></td>
            </tr>
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
                    <br>
                    <br>
                    <br>
                    
                <%@include file="Footer.jsp" %>
    </body>
</html>
