<%-- 
    Document   : State
    Created on : 10 Dec, 2019, 10:55:23 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
        String gname,edid="",genre="",hid="";
        if(request.getParameter("btnsubmit")!=null)
        {
            gname=request.getParameter("txtgenre");
            hid=request.getParameter("txthid");
            if(hid!="")
            {
                String up="update tbl_mgenre set mgenre_name='"+gname+"' where mgenre_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("MusicianGenre.jsp");
            }
            else
            {
            String ins="insert into tbl_mgenre(mgenre_name)values('"+gname+"')";
            obj.executeCommand(ins);
            }
        }
        if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_mgenre where mgenre_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
        if(request.getParameter("editid")!=null)
        {
        edid=request.getParameter("editid");
        String sel1="select * from tbl_mgenre where mgenre_id='"+edid+"'";
        ResultSet rs1=obj.selectCommand(sel1);
        if(rs1.next())
        {
            genre=rs1.getString("mgenre_name");
        }
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MusicGenre</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            
            <table  class="table">
                <tr>
                    <input type="hidden" id="txthid" name="txthid" value="<%=edid%>">
                    <td>Genre</td>
                    <td><input type="text"  name="txtgenre" id="txtgenre" value="<%=genre%>" autofocus="autofocus" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" class="btn btn-primary mt-2 mt-xl-0" value="Cancel">
                        <input type="submit" name="btnsubmit" id="btnsubmit" class="btn btn-primary mt-2 mt-xl-0" value="Submit"></div></td>
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
                <th>Genre</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
                      
        <%
            String sel="select * from tbl_mgenre";
            ResultSet rs=obj.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("mgenre_name")%></td>
                <td><a href="MusicianGenre.jsp?delid=<%=rs.getString("mgenre_id")%>">Delete</a>
                <a href="MusicianGenre.jsp?editid=<%=rs.getString("mgenre_id")%>">Edit</a></td>
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
