<%-- 
    Document   : State
    Created on : 10 Dec, 2019, 10:55:23 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
        String sname,edid="",state="",hid="";
        if(request.getParameter("btnsubmit")!=null)
        {
            sname=request.getParameter("txtstate");
            hid=request.getParameter("txthid");
            if(hid!="")
            {
                String up="update tbl_state set state_name='"+sname+"' where state_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("State.jsp");
            }
            else
            {
            String ins="insert into tbl_state(state_name)values('"+sname+"')";
            obj.executeCommand(ins);
            }
        }
        if(request.getParameter("delid")!=null)
        {
            String del="delete from tbl_state where state_id='"+request.getParameter("delid")+"'";
            obj.executeCommand(del);
        }
        if(request.getParameter("editid")!=null)
        {
        edid=request.getParameter("editid");
        String sel1="select * from tbl_state where state_id='"+edid+"'";
        ResultSet rs1=obj.selectCommand(sel1);
        if(rs1.next())
        {
            state=rs1.getString("state_name");
        }
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>State</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
                <tr>
                    <input type="hidden" id="txthid" name="txthid" value="<%=edid%>">
                    <td>State</td>
                    <td><input type="text" name="txtstate" id="txtstate" value="<%=state%>" autofocus="autofocus" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <div align="right">
                             <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0">
                            <input type="reset" name="btncancel" id="btncancel" value="Cancel" class="btn btn-primary mt-2 mt-xl-0">
                           
                        
                        </div>
                    </td>
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
                <th>State Name</th>
                <th>Action</th>
            </tr>
                      </thead>
                       <tbody>
        <%
            String sel="select * from tbl_state";
            ResultSet rs=obj.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                i++;
                        %>
                        
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("state_name")%></td>
                <td><a href="State.jsp?delid=<%=rs.getString("state_id")%>">Delete</a>
                <a href="State.jsp?editid=<%=rs.getString("state_id")%>">Edit</a></td>
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
