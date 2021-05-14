<%-- 
    Document   : Place
    Created on : 2 Dec, 2019, 11:07:27 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String dname="",subtype="",edid="",hid="",cname="",dis="";
if(request.getParameter("btnsubmit")!=null)
{
    dname=request.getParameter("slctartist");
    subtype=request.getParameter("txtartsub");
    hid=request.getParameter("txthid");
     if(hid!="")
            {
                String up="update tbl_artistsubtype set artsub_name='"+subtype+"' where artsub_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("ArtistSubType.jsp");
            }
            else
            {
              String ins="insert into tbl_artistsubtype(artist_id,artsub_name)values('"+dname+"','"+subtype+"')";
              obj.executeCommand(ins);
            }
}
if(request.getParameter("delid")!=null)
{
    String del="delete from tbl_artistsubtype where artsub_id='"+request.getParameter("delid")+"'";
    obj.executeCommand(del);
}
if(request.getParameter("editid")!=null)
{
    edid=request.getParameter("editid");
    String sel1="select * from tbl_artistsubtype where artsub_id='"+edid+"'";
    ResultSet rs1=obj.selectCommand(sel1);
    if(rs1.next())
    {
        cname=rs1.getString("artsub_name");
        dis=rs1.getString("artist_id");
    }
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artist Sub Type</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table border="1" align="center" cellpadding="10">
                <tr>
                    <input type="hidden" name="txthid" id="txthid" value="<%=edid%>">
                    <td>Artist</td>
                    <td><select name="slctartist" id="slctartist">
                            <option value="--select--">--Select--</option>
                            <%
                            String sel="select * from tbl_artist";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("artist_id")%>"<% if(rs.getString("artist_id").equals(dis)){ %> selected="" <% } %>><%=rs.getString("artist_name")%></option>
                            <%
                            }
                            %>
                        </select>
</td>
                </tr>
                <tr>
                    <td>Artist Sub Type</td>
                    <td><input type="text" name="txtartsub" id="txtartsub" value="<%=cname%>"></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel">
                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit"></div></td>
                </tr>
            </table>
        </form>
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
                                <th>Artist Sub Type</th>
                                <th>Action</th>
                            </tr>
                      </thead>
                      <tbody>
                            <%
                            String sel1="select * from tbl_artistsubtype p inner join tbl_artist d on d.artist_id=p.artist_id";
                            System.out.println(sel1);
                            ResultSet rs1=obj.selectCommand(sel1);
                            int i=0;
                            while(rs1.next())
                            {
                                i++;
                                %>
                            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("artist_name")%></td>
                <td><%=rs1.getString("artsub_name")%></td>
                <td><a href="ArtistSubType.jsp?delid=<%=rs1.getString("artsub_id")%>">Delete</a>
                <a href="ArtistSubType.jsp?editid=<%=rs1.getString("artsub_id")%>">Edit</a></td>
            </tr>
                            <%
                            }
                            %>
                        </tbody>
        </table>
                         </div>
                </div>
              </div>
            </div>
          </div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
