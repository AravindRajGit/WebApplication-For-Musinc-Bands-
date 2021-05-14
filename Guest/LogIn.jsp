

<%-- 
    Document   : Login
    Created on : 30 Nov, 2019, 2:56:58 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style> 
           	 table, th, td { 
               
               
           					 } 
           		 th, td { 
               			 padding: 12px; 
                			background-color:none; 
           				 } 
              
           		 h1 { 
           				 color:green; 
            		} 
        </style> 
    <%@include file="Links.jsp" %>
     
    </head>
    <%
      String uname="",password="";
      if(request.getParameter("btnsubmit")!=null)
      {
        uname=request.getParameter("txtusername");
        password=request.getParameter("password");
        String sel="select * from tbl_user where user_username='"+uname+"' and user_password='"+password+"'";
        ResultSet rs=obj.selectCommand(sel);
        
        String sel1="select * from tbl_musicband where band_username='"+uname+"' and band_password='"+password+"' and band_status='1'";
        ResultSet rs1=obj.selectCommand(sel1);
        
        String sel2="select * from tbl_musician where musician_username='"+uname+"' and musician_password='"+password+"'";
        ResultSet rs2=obj.selectCommand(sel2);
        
        String sel3="select * from tbl_admin where admin_username='"+uname+"' and admin_password='"+password+"'";
        ResultSet rs3=obj.selectCommand(sel3);
        
        String sel4="select * from tbl_bandmember where bandmember_username='"+uname+"' and bandmember_password='"+password+"'";
        ResultSet rs4=obj.selectCommand(sel4);
        
        if(rs.next())
        {
            session.setAttribute("userid", rs.getString("user_id"));
            session.setAttribute("uname", rs.getString("user_username"));
            response.sendRedirect("../User/HomePage.jsp");
        }
        
        else if(rs1.next())
        {
            session.setAttribute("bandid", rs1.getString("band_id"));
            session.setAttribute("bandname", rs1.getString("band_username"));
            response.sendRedirect("../MusicBand/DashBoard.jsp");
        }
        
         else if(rs2.next())
        {
            session.setAttribute("musicianid", rs2.getString("musician_id"));
            session.setAttribute("musicianname", rs2.getString("musician_username"));
            session.setAttribute("mStatus", rs2.getString("musician_status"));
            response.sendRedirect("../Musician/HomePage.jsp");
        }
         else if(rs3.next())
        {
            session.setAttribute("adminid", rs3.getString("admin_id"));
            session.setAttribute("adminname", rs3.getString("admin_username"));
            response.sendRedirect("../Admin/DashBoard.jsp");
        }
         else if(rs4.next())
        {
            session.setAttribute("memberid", rs4.getString("bandmember_id"));
            session.setAttribute("membername", rs4.getString("bandmember_username"));
            response.sendRedirect("../BandMembers/HomePage.jsp");
        }
        else
        {
            out.println("Invalid Password!");
        }
      }
    %>
    <body>
        
        <%@include  file="Header.jsp" %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form>
            <center>
                 <table border="0" cellpadding="10" align="center">
                            <tr>
                                <td>User Name</td>
                                <td>  <input type="text" id="txtusername" name="txtusername"  placeholder="User Name"></td>
                            </tr>
            
            
                            <tr>
                                <td>Password</td>
                                <td> <input type="password"  name="password" id="password" placeholder="Password"> </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="Signin" name="btnsubmit" id="btnsubmit">
                                </td>
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
        <br>
        <br>
        <br>
        <br>
        <br> 
        <%@include file="Footer.jsp" %>              
    </body>
</html>
