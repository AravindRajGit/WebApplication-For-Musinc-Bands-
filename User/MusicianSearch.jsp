<%-- 
    Document   : MusicianSearch
    Created on : 31 Dec, 2019, 10:50:50 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    <%@include file="Links.jsp" %>
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
        <table border="0" align="center" cellpadding="10">
            <tr>
                <td>Music band</td>
                        <td><select name="slctband"id="slctband">
                    <option value="1">--Select--</option>
                <%
                String sel="select * from tbl_musicband";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                { 
                %>
                <option value="<%=rs.getString("band_id")%>"><%=rs.getString("band_name")%></option>
                <%
                }
                %>
                    </select></td>
            
                <td colspan="2"><div align="right"><input type="Submit" value="Search" name="btnsearch"></div></td>
   
            </tr>
        </table>
            </center>
        </form>
<%
    String name="",contact="",email="",photo="",band="";
    if(request.getParameter("btnsearch")!=null)
        band=request.getParameter("slctband");
    { 
       %>
    <center>
                   <table border="0" align="center" cellpadding="10">
                       <tr>
<%
       String sel1="select * from tbl_bandmember m inner join tbl_musicband b on b.band_id=m.band_id inner join tbl_artistsubtype asub on m.artsub_id=asub.artsub_id inner join tbl_artist ar on asub.artist_id=ar.artist_id where  m.band_id='"+band+"'";
       System.out.print(sel1);
       ResultSet rs1=obj.selectCommand(sel1);
        int i=0;
        while(rs1.next())
        {
            i++;
                   %>
        <td>
            <p><img src="../Musician/Photo/<%=rs1.getString("bandmember_photo")%>" width="120" height="120"></p>
                <p><%=rs1.getString("bandmember_name")%></p>
                
                <p><b><%=rs1.getString("artist_name")%></b></p>
                <p><b><%=rs1.getString("artsub_name")%></b></p>
        </td>
            <%
            if(i==4)
        {
        %> 
            </tr>
           <%
            i=0;
        }
    }
    }
        %>
                   </table>
    </center>
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
