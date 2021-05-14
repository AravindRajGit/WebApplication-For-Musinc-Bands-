<%-- 
    Document   : BandGallery
    Created on : 27 Dec, 2019, 2:00:23 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Band Gallery</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
            <form method="post" enctype="multipart/form-data" action="GalleryUpload.jsp">
                <table class="table" cellpadding="10">
                <tr>
                    <td>File</td>
                    <td><input type="file" name="filephoto" id="filephoto" required="required"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="txtdesc" id="txtdesc" rows="5" cols="20" required="required"></textarea></td>
                </tr>
                <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" class="btn btn-primary mt-2 mt-xl-0" value="Cancel">
                <input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-primary mt-2 mt-xl-0" value="Submit"</td>
                </tr>
            </table>
        </form>
        <br/>
        <table border="0" align="center" cellpadding="10">
            <%
        String sel="select * from tbl_bandgallery where band_id='"+session.getAttribute("bandid")+"'";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
            i++;
            if(i==1)
            {
            %>
             <tr>
                 <%
                }
        %>
       
        <td>
            <p><img src="../MusicBand/BandGallery/<%=rs.getString("band_file")%>" width="150xp" height="150xp"></p>
            <p><%=rs.getString("band_desc")%></p>
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
        %>
        </table>
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
