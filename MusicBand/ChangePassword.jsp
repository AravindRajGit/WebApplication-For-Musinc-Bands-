<%-- 
    Document   : Changepassword
    Created on : 30 Nov, 2019, 4:55:14 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>


<%
    if(request.getParameter("btnchange")!=null)
    {
     String bandid=session.getAttribute("bandid").toString();
     String cpassword="", ePassword="",newPassword="",CnewPassword="";
        String sel="select * from tbl_musicband where band_id='"+bandid+"'";
        //System.out.println(sel);
        ResultSet rs=obj.selectCommand(sel);
        if(rs.next())
        {
        
        cpassword=rs.getString("band_password");
        }
        ePassword=request.getParameter("txtPassword");
        
        
        if(cpassword.equals(ePassword))
        {
           newPassword=request.getParameter("txtnpassword");
           CnewPassword=request.getParameter("txtcopassword");
        if(newPassword.equals(CnewPassword))
        {
        String up="update tbl_musicband set band_password='"+newPassword+"' where band_id='"+bandid+"'";
        //System.out.println(up);
        boolean status=obj.executeCommand(up);
        if(status==true)
        {
            %>
          <script type="text/javascript">
            alert("Updated Successfully..");
            setTimeout(function(){window.location.href='ChangePassword.jsp'},40);//40millisecend it go to next page
        </script>
        <%
        }
        }
        else
        {
       %>
       <script type="text/javascript">alert("New Password Mismatch!");</script>
        <%
        }
    }
        else   
        {
            %>
            <script type="text/javascript">alert("Current Password Mismatch");</script>
            <%
        }
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Band Change Password</title>
        <%@include file="Links.jsp" %>
        
    </head>
    
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
                <tr>
                <td>Current Password</td>
                <td><input type="password" name="txtPassword" id="txtPassword" autofocus required</td>
            </tr>
            <tr>
                <td>New Password</td>
                <td><input type="password" name="txtnpassword" id="txtnpassword" required</td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="txtcopassword" id="txtcopassword" required</td>
            </tr>
            <tr>
                <td colspan="2"><div align="right">
                        <input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0">
                    <input type="submit" name="btnchange" id="btnchange" value="Change" class="btn btn-primary mt-2 mt-xl-0">
                    </div></td>
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
