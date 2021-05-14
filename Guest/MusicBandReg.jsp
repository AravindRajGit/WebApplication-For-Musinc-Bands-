<%-- 
    Document   : Userreg
    Created on : 30 Nov, 2019, 12:22:59 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Music Band</title>
    <%@include file="Links.jsp" %>
    </head>
    <style> 
           	 table, th, td { 
               
               
           					 } 
           		 th, td { 
               			 padding: 6px; 
                			background-color:none; 
           				 } 
              
           		 h1 { 
           				 color:green; 
            		} 
					body{
						
						background:url(../icons/bg2.jpg);
						background-size:cover;
						
						
						}
        </style> 
    <body>
        
        <%@include file="Header.jsp" %>
        <br>
        <br>
        
        <form method="post" enctype="multipart/form-data" action="MusicBandUpload.jsp">
            <center>
            <table cellpadding="5">
            <tr>
                    <td>Band Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required" autofocus="autofocus"></td>
            </tr>
            <tr>
                    <td>Year of Origin</td>
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
                    <td>Contact No</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" required="required"></td>
            </tr>
            <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="txtemail" required="required"></td>
            </tr>
            <tr>
                    <td>No:of Band Members</td>
                    <td><input type="text" name="txtnum" id="txtnum" required="required"></td>
            </tr>
            <tr>
                    <td>Logo</td>
                    <td><input type="file" name="filelogo" id="filelogo" required="required"></td>
            </tr>
            <tr>
                <td>License Type</td>
                <td><select name="slctlicense"id="slctlicense" required="required">
                <option value="--select--">--Select--</option>
                <%
                String sel="select * from tbl_license";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                { 
                %>
                <option value="<%=rs.getString("license_id")%>"><%=rs.getString("license_name")%></option>
                <%
                }
                %>
                    </select>
                </td>
            </tr>
            <tr>
                    <td>License Proof</td>
                    <td><input type="file" name="fileproof" id="fileproof" required="required"></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="txtusername" id="txtusername" required="required"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="txtpassword" id="txtpassword" required="required"></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="txtcpassword" id="txtcpassword" required="required"</td>
            </tr>
            <tr>
                <td colspan="2"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"</td>
            </tr>
            </table>
            </center>
        </form>
                    <br>
                    <br>
                    <br>
                <%@include file="Footer.jsp" %>   
    </body>
</html>
