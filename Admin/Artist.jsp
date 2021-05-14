<%-- 
    Document   : State
    Created on : 10 Dec, 2019, 10:55:23 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
        String aname,edid="",artist="",hid="";
        if(request.getParameter("btnsubmit")!=null)
        {
            aname=request.getParameter("txtartist");
            hid=request.getParameter("txthid");
            if(hid!="")
            {
                String up="update tbl_artist set artist_name='"+aname+"' where artist_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("Artist.jsp");
            }
            else
            {
            String ins="insert into tbl_artist(artist_name)values('"+aname+"')";
            obj.executeCommand(ins);
            }
        }
        if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_artist where artist_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
        if(request.getParameter("editid")!=null)
        {
        edid=request.getParameter("editid");
        String sel1="select * from tbl_artist where artist_id='"+edid+"'";
        ResultSet rs1=obj.selectCommand(sel1);
        if(rs1.next())
        {
            artist=rs1.getString("artist_name");
        }
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artist</title>
          <%@include  file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post" class="table">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <input type="hidden" id="txthid" name="txthid" value="<%=edid%>">
                    <td>Artist</td>
                    <td><input type="text" name="txtartist" id="txtartist" value="<%=artist%>" autofocus="autofocus" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" class="btn btn-primary mt-2 mt-xl-0" value="Cancel">
                        <input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-primary mt-2 mt-xl-0" value="Submit"></div></td>
                </tr>
            </table>
        </form>
        <br/>
        <br/>
                         <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">District Entry</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                        <thead>
            <tr>
                <th>Sl.no</th>
                <th>Artist</th>
                <th>Action</th>
            </tr>
                        </thead>
                         <tbody>
        <%
            String sel="select * from tbl_artist";
            ResultSet rs=obj.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                i++;
                        %>
                       
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("artist_name")%></td>
                <td><a href="Artist.jsp?delid=<%=rs.getString("artist_id")%>">Delete</a>
                <a href="Artist.jsp?editid=<%=rs.getString("artist_id")%>">Edit</a></td>
            </tr>
                        </tbody>
            <%
                        }
            %>
        </table>
          </div>
                </div>
              </div>
            </div>
          </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
