 <%-- 
    Document   : Editprofile
    Created on : 30 Nov, 2019, 4:54:44 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String userid=session.getAttribute("userid").toString();
String name="",gender="",dob="",address="",district="",place="",contact="",email="",username="";

String sel="select * from tbl_user u inner join tbl_city p on p.city_id=u.city_id where user_id='"+userid+"'";
ResultSet rs=obj.selectCommand(sel);
if(rs.next())
{
name=rs.getString("user_name");
gender=rs.getString("user_gender");
dob=rs.getString("user_dob");
address=rs.getString("user_address");
district=rs.getString("district_id");
place=rs.getString("city_id");
contact=rs.getString("user_contact");
email=rs.getString("user_email");
username=rs.getString("user_username");
}
if(request.getParameter("btnsubmit")!=null)
{
    String uname="",ugender="",udob="",uaddress="",udistrict="",ucity="",ucontact="",uemail="",uusername="";
    uname=request.getParameter("txtname");
    ugender=request.getParameter("rdbgender");
    udob=request.getParameter("txtdob");
    uaddress=request.getParameter("txtaddress");
    udistrict=request.getParameter("slctdistrict");
    ucity=request.getParameter("slctcity");
    ucontact=request.getParameter("txtcontact");
    uemail=request.getParameter("txtemail");
    uusername=request.getParameter("txtusername");
    String up="update tbl_user set user_name='"+uname+"',user_gender='"+ugender+"',user_dob='"+udob+"',user_address='"+uaddress+"',city_id='"+ucity+"',user_contact='"+ucontact+"',user_email='"+uemail+"',user_username='"+uusername+"' where user_id='"+userid+"'";
    boolean status=obj.executeCommand(up);
   // response.sendRedirect("EditProfile.jsp");
    if(status==true)
    {
      %> 
       <script type="text/javascript">
            alert("Updated Successfully..");
            setTimeout(function(){window.location.href='EditProfile.jsp'},40);//40millisecend it go to next page
        </script>
     <%
    }
     }    

        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Edit Profile</title>
        <script src="../Admin/JQ/jq.js"></script>
        <script>
function getplace(did)
{
  $.ajax({url: 'AjaxCityUser.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctcity').html(data);
  },
  });

}
</script>
  <style> 
            table, th, td { 
               // border: 2px solid ; 
               // text-align:center; 
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
        <form method="post">
            <center>
            <table border="2" align="center" cellpadding="10">
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="rdbgender" id="rdbgender" value="Male"<% if(gender.equals("Male")){%> checked <%}%>>Male
                        <input type="radio" name="rdbgender" id="rdbgender" value="Female"<% if(gender.equals("Female")){%> checked <%}%>>Female
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="txtdob" id="txtdob" value="<%=dob%>"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" id="txtaddress" rows="5" cols="20"><%=address%></textarea></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="slctdistrict" id="slctdistrict" onchange="getplace(this.value)">
                                    <option value="<%=district%>">---Select---</option>
                <%
                String sel1="select * from tbl_district";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {
                  
                %>
                <option value="<%=rs1.getString("district_id")%>" <% if(district.equals(rs1.getString("district_id"))){%> selected <%}%>><%=rs1.getString("district_name")%></option>
                <%
                }
                %>
                        </select></td>
                </tr>
                <tr>
                    <td>Place</td>
                            <td><select name="slctcity" id="slctcity" >
                         <%
                String sele="select * from tbl_city";
                ResultSet rse=obj.selectCommand(sele);
                while(rse.next())
                { 
                %>
                <option value="<%=rse.getString("city_id")%>"<% if(place.equals(rse.getString("city_id"))){%> selected <%}%>><%=rse.getString("city_name")%></option>
                <%
                }
                %>
                        </select></td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" value="<%=contact%>"</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="txtemail" value="<%=email%>"</td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtusername" id="txtusername" value="<%=username%>"></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Update"></div></td>
                </tr>
            </table>
            </center>
        </form>
                <br>
                <br>
                <br>
                    <%@include file="Footer.jsp"%>
    </body>
</html>
