<%-- 
    Document   : Editprofile
    Created on : 30 Nov, 2019, 4:54:44 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String musicianid=session.getAttribute("memberid").toString();
String name="",gender="",dob="",address="",district="",city="",contact="",email="",artist="",username="";

String sel="select * from tbl_musician m inner join tbl_city d on d.city_id=m.city_id inner join tbl_artist ar on ar.artist_id=m.artist_id inner join tbl_district dis on dis.district_id=d.district_id where musician_id='"+musicianid+"'";
ResultSet rs=obj.selectCommand(sel);
if(rs.next())
{
name=rs.getString("musician_name");
gender=rs.getString("musician_gender");
dob=rs.getString("musician_dob");
address=rs.getString("musician_address");
city=rs.getString("city_id");
district=rs.getString("district_id");
contact=rs.getString("musician_contact");
email=rs.getString("musician_email");
artist=rs.getString("artist_id");
username=rs.getString("musician_username");
}
if(request.getParameter("btnsubmit")!=null)
{
    String mname="",mgender="",mdob="",maddress="",mcity="",mcontact="",memail="",martist="",musername="";
    mname=request.getParameter("txtname");
    mgender=request.getParameter("rdbgender");
    mdob=request.getParameter("txtdob");
    maddress=request.getParameter("txtaddress");
    mcity=request.getParameter("slctcity");
    mcontact=request.getParameter("txtcontact");
    memail=request.getParameter("txtemail");
    martist=request.getParameter("slctartist");
    musername=request.getParameter("txtusername");
    String up="update tbl_musician set musician_name='"+mname+"',musician_gender='"+mgender+"',musician_dob='"+mdob+"',musician_address='"+maddress+"',city_id='"+mcity+"',musician_contact='"+mcontact+"',musician_email='"+memail+"',artist_id='"+martist+"',musician_username='"+musername+"' where musician_id='"+musicianid+"'";
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
        <title>Musician Edit Profile</title>
        <script src="../Admin/JQ/jq.js"></script>
        <script>
function getcity(did)
{
  $.ajax({url: 'AjaxCityMusician.jsp?did='+did,
  type: 'GET',
  success: function(data) {
	  
	  $('#slctcity').html(data);
  },
  });

}
</script>
<%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table border="2" align="center" cellpadding="10">
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" value="<%=name%>" required="required" autofocus="autofocus"></td>
            </tr>
            <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="rdbgender" id="rdbgender" value="Male"<% if(gender.equals("Male")){%> checked <%}%>>Male
                        <input type="radio" name="rdbgender" id="rdbgender" value="Female"<% if(gender.equals("Female")){%> checked <%}%>>Female
                    </td>
            </tr>
            <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="txtdob" id="txtdob" value="<%=dob%>" required="required"></td>
            </tr>
            <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" id="txtaddress" rows="5" cols="20" required="required"><%=address%></textarea></td>
            </tr>
            <tr>
                    <td>District</td>
                    <td><select name="slctdistrict"id="slctdistrict" onchange="getcity(this.value)">
                <%
                String sele="select * from tbl_district";
                ResultSet rse=obj.selectCommand(sele);
                while(rse.next())
                { 
                %>
                <option value="<%=rse.getString("district_id")%>"<% if(district.equals(rse.getString("district_id"))){%> selected <%}%>><%=rse.getString("district_name")%></option>
                <%
                }
                %>
                   </select>
                   </td>
            </tr>
            <tr>
                    <td>City</td>
                            <td><select name="slctcity" id="slctcity" >
                         <%
                String sel2="select * from tbl_city";
                ResultSet rs2=obj.selectCommand(sel2);
                while(rs2.next())
                { 
                %>
                <option value="<%=rs2.getString("city_id")%>"<% if(city.equals(rs2.getString("city_id"))){%> selected <%}%>><%=rs2.getString("city_name")%></option>
                <%
                }
                %>
                        </select></td>
                </tr>
            <tr>
                    <td>Contact No</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" value="<%=contact%>" required="required"></td>
            </tr>
            <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="email" value="<%=email%>" required="required"></td>
            </tr>
            <tr>
                <td>Artist</td>
                        <td><select name="slctartist"id="slctartist" required="required">
                    <option value="--select--">--Select--</option>
                <%
                String select="select * from tbl_artist";
                ResultSet rsect=obj.selectCommand(select);
                while(rsect.next())
                { 
                %>
                <option value="<%=rsect.getString("artist_id")%>"<% if(artist.equals(rsect.getString("artist_id"))){%> selected <%}%>><%=rsect.getString("artist_name")%></option>
                <%
                }
                %>
                    </select></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="txtusername" id="txtusername" value="<%=username%>" required="required"></td>
            </tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Update"></div></td>
                </tr>
            </table>
        </form>
                <%@include file="Footer.jsp" %>
    </body>
</html>
