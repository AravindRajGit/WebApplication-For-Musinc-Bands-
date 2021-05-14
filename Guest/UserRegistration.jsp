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
        <title>User Registration</title>
        
    <%@include  file="Links.jsp" %>
        <script src="../Admin/JQ/jq.js"></script>
        <script>
function getdistrict(sid)
{
  $.ajax({url: '../User/AjaxDistrictUser.jsp?sid='+sid,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctdistrict').html(data);
  },
  });

}
function getcity(did)
{
  $.ajax({url: '../User/AjaxCityUser.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctcity').html(data);
  },
  });

}
</script>
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
    </head>
     
    <body>
     
        <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <form action="UserUpload.jsp" enctype="multipart/form-data" method="post">
            <div align="center">
            <table cellpadding="10" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" class="form-control" name="txtname" id="txtname" required="required" autofocus="autofocus"></td>
                </tr>
                
                <tr>
                    <td>Gender</td>
                    <td>
                       <input type="radio"  name="rdbgender" id="rdbgender" value="Male">Male
                       <input type="radio"  name="rdbgender" id="rdbgender" value="Female">Female
                    </td>
                </tr>
                
                <tr>
                    <td>Date of birth</td>
                    <td><input type="date" class="form-control" name="dob" id="dob" required="required"></td>
                </tr>
                
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" class="form-control" id="txtaddress" rows="5" cols="20" required="required"></textarea></td>
                </tr>
                
                <tr>
                    <td>State</td>
                    <td>
                         <select name="slctstate" id="slctstate"  class="form-control" required="required" onchange="getdistrict(this.value)">
                                <option value="--select--">--Select--</option>
                                    <%
                                        String sele="select * from tbl_state";
                                        ResultSet rse=obj.selectCommand(sele);
                                            while(rse.next())
                                                { 
                                    %>
                                                     <option value="<%=rse.getString("state_id")%>"><%=rse.getString("state_name")%></option>
                                    <%
                                                }
                                    %>
            </select>
                    </td>
                </tr>
                
                <tr>
                    <td>District</td>
                    <td><select name="slctdistrict"id="slctdistrict" class="form-control" onchange="getcity(this.value)"></select></td>
                </tr>
                
                <tr>
                    <td>City</td>
                    <td><select name="slctcity" class="form-control" id="slctcity"></select></td>
                </tr>
                
                <tr>
                    <td>Contact</td>
                    <td><input type="text" class="form-control" name="txtcontact" id="txtcontact" required="required"></td>
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td> <input type="email" class="form-control" name="txtemail" id="email" required="required"></td>
                </tr>
                
                <tr>
                    <td>User name</td>
                    <td><input type="text" class="form-control" name="txtusername" id="txtusername" required="required"></td>
                </tr>
                
                
                <tr>
                    <td>Password</td>
                    <td><input type="password" class="form-control" name="txtpassword" id="txtpassword" required="required"></td>
                </tr>
                
                
                <tr>
                    <td>Confirm password</td>
                    <td><input type="text" class="form-control" name="txtusername" id="txtusername" required="required"></td>
                </tr> 
                
                
                <tr>
                    <td colspan="2"><button type="submit" name="btnsubmit" id="btnsubmit" class="btn oneMusic-btn mt-30">Sign Up</button></td>
                </tr>
  
            </table>
            </div>                              
        </form>
        <br>
        <br>
        <br>
        <%@include  file="Footer.jsp" %>
    </body>
</html>
