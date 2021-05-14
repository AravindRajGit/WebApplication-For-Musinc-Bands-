<%-- 
    Document   : Editprofile
    Created on : 30 Nov, 2019, 4:54:44 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String bandid=session.getAttribute("bandid").toString();
String name="",year="",district="",contact="",email="",memnum="",username="";

String sel="select * from tbl_musicband u inner join tbl_district p on p.district_id=u.district_id where band_id='"+bandid+"'";
ResultSet rs=obj.selectCommand(sel);
if(rs.next())
{
name=rs.getString("band_name");
year=rs.getString("band_year");
district=rs.getString("district_id");
contact=rs.getString("band_contact");
email=rs.getString("band_email");
memnum=rs.getString("band_membersnum");
username=rs.getString("band_username");
}
if(request.getParameter("btnsubmit")!=null)
{
    String bname="",byear="",bdistrict="",bcontact="",bemail="",bmemnum="",busername="";
    bname=request.getParameter("txtname");
    byear=request.getParameter("txtyear");
    bdistrict=request.getParameter("slctdistrict");
    bcontact=request.getParameter("txtcontact");
    bemail=request.getParameter("txtemail");
    bmemnum=request.getParameter("txtnum");
    busername=request.getParameter("txtusername");
    String up="update tbl_musicband set band_name='"+bname+"',band_year='"+byear+"',district_id='"+bdistrict+"',band_contact='"+bcontact+"',band_email='"+bemail+"',band_membersnum='"+bmemnum+"',band_username='"+busername+"' where band_id='"+bandid+"'";
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
        <title>Band Edit Profile</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        
        <form method="post">
            <table class="table">
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" id="txtname" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>Year of Origin</td>
                    <td><input type="text" name="txtyear" id="txtyear" value="<%=year%>"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="slctdistrict" id="slctdistrict">
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
                    <td>Contact No</td>
                    <td><input type="text" name="txtcontact" id="txtcontact" value="<%=contact%>"</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="txtemail" value="<%=email%>"</td>
                </tr>
                <tr>
                    <td>No:of Band Members</td>
                    <td><input type="text" name="txtnum" id="txtnum" value="<%=memnum%>"</td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtusername" id="txtusername" value="<%=username%>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div align="right">
                             <input type="submit" name="btnsubmit" id="btnsubmit"class="btn btn-primary mt-2 mt-xl-0" value="Update">
                            <input type="reset" name="btncancel" id="btncancel"class="btn btn-primary mt-2 mt-xl-0" value="Cancel">
                           
                        </div>
                    </td>
                </tr>
            </table>
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
