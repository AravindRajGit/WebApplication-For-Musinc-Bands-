<%-- 
    Document   : State
    Created on : 10 Dec, 2019, 10:55:23 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
        String lname,edid="",license="",hid="";
        if(request.getParameter("btnsubmit")!=null)
        {
            lname=request.getParameter("txtlicense");
            hid=request.getParameter("txthid");
            if(hid!="")
            {
                String up="update tbl_license set license_name='"+lname+"' where license_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("License.jsp");
            }
            else
            {
            String ins="insert into tbl_license(license_name)values('"+lname+"')";
            obj.executeCommand(ins);
            }
        }
        if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_license where license_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
        if(request.getParameter("editid")!=null)
        {
        edid=request.getParameter("editid");
        String sel1="select * from tbl_license where license_id='"+edid+"'";
        ResultSet rs1=obj.selectCommand(sel1);
        if(rs1.next())
        {
            license=rs1.getString("license_name");
        }
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>License</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
            <table class="table">
                <tr>
                    <input type="hidden" id="txthid" name="txthid" value="<%=edid%>">
                    <td>License</td>
                    <td><input type="text" name="txtlicense" id="txtlicense" value="<%=license%>" autofocus="autofocus" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="right"><input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0">
                        <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0"></div></td>
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
                <th>License</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
        <%
            String sel="select * from tbl_license";
            ResultSet rs=obj.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("license_name")%></td>
                <td><a href="License.jsp?delid=<%=rs.getString("license_id")%>">Delete</a>
                <a href="License.jsp?editid=<%=rs.getString("license_id")%>">Edit</a></td>
            </tr>
            <%
                        }
            %> </tbody>
        </table>
                         </div>
                </div>
              </div>
            </div>
          </div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
