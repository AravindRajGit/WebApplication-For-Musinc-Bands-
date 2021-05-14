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
        <title>Musician Registration</title>
        
        <script src="../Admin/JQ/jq.js"></script>
        <script>
function getcity(did)
{
  $.ajax({url: '../Musician/AjaxCityMusician.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctcity').html(data);
  },
  });
}
function getartsub(aid)
{
    
  $.ajax({url: '../Musician/AjaxArtSub.jsp?aid='+aid,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctsub').html(data);
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
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br>
        
        <form method="post" enctype="multipart/form-data" action="MusicianUpload.jsp">
            <center>
            <table >
            <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required" autofocus="autofocus"></td>
            </tr>
            <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="rdbgender" id="rdbgender" value="Male">Male
                        <input type="radio" name="rdbgender" id="rdbgender" value="Female">Female
                    </td>
            </tr>
            <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="dob" id="dob" required="required"></td>
            </tr>
            <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" id="txtaddress" rows="5" cols="20" required="required"></textarea></td>
            </tr>
            <tr>
                    <td>District</td>
                    <td><select name="slctdistrict"id="slctdistrict" onchange="getcity(this.value)">
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
                    <td>City</td>
                    <td><select name="slctcity" id="slctcity"></select></td>
            </tr>
            <tr>
                    <td>Contact No</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" required="required"></td>
            </tr>
            <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="email" required="required"></td>
            </tr>
            <tr>
                <td>Artist</td>
                        <td><select name="slctartist" id="slctartist" onchange="getartsub(this.value)">
                    <option value="0">--Select--</option>
                <%
                String sel="select * from tbl_artist";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                { 
                %>
                <option value="<%=rs.getString("artist_id")%>"><%=rs.getString("artist_name")%></option>
                <%
                }
                %>
                    </select></td>
            </tr>
            <tr>
                    <td>ArtSub</td>
                    <td><select name="slctsub" id="slctsub"></select></td>
            </tr>
            <tr>
                    <td>Photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required="required"></td>
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
