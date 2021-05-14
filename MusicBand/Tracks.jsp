<%-- 
    Document   : Event
    Created on : 27 Dec, 2019, 3:12:49 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
    if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_tracks where track_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track</title>
        <script src="../Admin/JQ/jq.js"></script>
        <script>
        
    function AddStock(tid)
    {
    $.ajax({url: 'AjaxStock.jsp?tid='+tid,
    type: 'GET',
    success: function(data) {
	  
	  $('#StockDiv').html(data);
    },
        });

    }
    </script>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post" enctype="multipart/form-data" action="TrackUpload.jsp">
            <table class="table">
                <tr>
                    <td>Track Name</td>
                    <td><input type="text" name="txtname" id="txtname" required="required"</td>
                </tr> 
                <tr>
                <td>Genre</td>
                <td><select name="slctgenre"id="slctgenre" required="required">
                <option value="--select--">--Select--</option>
                <%
                String select="select * from tbl_genre";
                ResultSet rse1=obj.selectCommand(select);
                while(rse1.next())
                { 
                %>
                <option value="<%=rse1.getString("genre_id")%>"><%=rse1.getString("genre_name")%></option>
                <%
                }
                %>
                    </select>
                </td>
            </tr>
                <tr>
                    <td>Track Details</td>
                    <td><textarea name="txtdetails" id="txtdetails" rows="5" cols="30" required="required"></textarea></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="txtrate" id="txtrate" required="required"</td>
                </tr>
                <tr>
                    <td>photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required="required" </td>
                </tr>
            <tr>
                <td colspan="2" align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0">
                    <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0"></td>
            </tr>
            </table>    
        </form>
                    <br/>
                    <table  align="center" cellpadding="10">
        <%
        String sel="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id where band_id='"+session.getAttribute("bandid")+"'";
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
            <p><img src="../MusicBand/TrackPhoto/<%=rs.getString("track_photo")%>" width="150xp" height="150xp"></p>
            <p>Track : <%=rs.getString("track_name")%></p>
            <p>Genre : <%=rs.getString("genre_name")%></p>
            <p>Description : <%=rs.getString("track_detail")%></p>
            <p>Price : <%=rs.getString("track_price")%></p>
            <p><a href="Tracks.jsp?delid=<%=rs.getString("track_id")%>">Delete</a></p>
            <p><input type="button" name="btnStock" id="btnStock" value="Add Stock" onclick="AddStock(<%=rs.getString("track_id")%>)"></p>
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
            
            <form>
                <div id="StockDiv">
                    
                </div>
                <%
        if(request.getParameter("btnSubmit")!=null)
        {
        String currentStock="",stock="",trackid="";
        int TotalStock=0;
        stock=request.getParameter("txtStock");
        trackid=request.getParameter("txtTrack");
        
        String Sel="select * from tbl_tracks where track_id='"+ trackid +"'";
        System.out.print(Sel);
        
        ResultSet rs1=obj.selectCommand(Sel);
        if(rs1.next())
        {
        currentStock=rs1.getString("track_stock");
        }
        
        TotalStock=Integer.parseInt(currentStock)+Integer.parseInt(stock);
        
                String up="update tbl_tracks set track_stock='"+TotalStock+"' where track_id='"+trackid+"'";
                obj.executeCommand(up);
         out.print(up);
        }
                %>
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
                <%@include file="Footer.jsp" %>
    </body>
</html>
