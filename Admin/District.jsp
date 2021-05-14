<%-- 
    Document   : District
    Created on : 9 Dec, 2019, 1:44:20 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
        String dname="",edid="",district="",hid="",sid="",sname="";
        if(request.getParameter("btnsubmit")!=null)
        {
            dname=request.getParameter("txtdistrict");
            sname=request.getParameter("slctstate");
            hid=request.getParameter("txthid");
            if(hid!="")
            {
                String up="update tbl_district set district_name='"+dname+"' where district_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("District.jsp");
            }
            else
            {
            String ins="insert into tbl_district(state_id,district_name)values('"+sname+"','"+dname+"')";
            obj.executeCommand(ins);
            }
        }
        if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_district where district_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
        if(request.getParameter("editid")!=null)
        {
        edid=request.getParameter("editid");
        String sel1="select * from tbl_district where district_id='"+edid+"'";
        ResultSet rs1=obj.selectCommand(sel1);
        if(rs1.next())
        {
            district=rs1.getString("district_name");
            sid=rs1.getString("state_id");
        }
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        
        <%@include file="Header.jsp" %>
        
        <form method="post">
            <table class="table" >
                <tr>
                <td>State</td>
                    <td><select name="slctstate" id="slctstate">
                            <option value="--select--">--Select--</option>
                            <%
                            String sel="select * from tbl_state";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("state_id")%>"<% if(rs.getString("state_id").equals(sid)){ %> selected="" <% } %>><%=rs.getString("state_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                     <input type="hidden" id="txthid" name="txthid" value="<%=edid%>">
                    <td>District</td>
                    <td><input type="text" name="txtdistrict" id="txtdistrict" value="<%=district%>" autofocus="autofocus" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div align="right">
                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0">
                            <input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0">
                        </div></td>
                </tr>
            </table>
        </form>
        <br/>
        
        ---------------------------------------------------------------
        <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">State Entry</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
            <tr>
                <th>Sl.no</th>
                <th>State</th>
                <th>District</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
            String sele="select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id";
            ResultSet rse=obj.selectCommand(sele);
            int i=0;
            while(rse.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rse.getString("state_name")%></td>
                <td><%=rse.getString("district_name")%></td>
                <td><a href="District.jsp?delid=<%=rse.getString("district_id")%>">Delete</a>
                <a href="District.jsp?editid=<%=rse.getString("district_id")%>">Edit</a></td>
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
