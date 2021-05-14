<%-- 
    Document   : Place
    Created on : 2 Dec, 2019, 11:07:27 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
String dname="",city="",edid="",hid="",cname="",dis="";
if(request.getParameter("btnsubmit")!=null)
{
    dname=request.getParameter("slctdistrict");
    city=request.getParameter("txtcity");
    hid=request.getParameter("txthid");
     if(hid!="")
            {
                String up="update tbl_city set city_name='"+city+"' where city_id='"+hid+"'";
                obj.executeCommand(up);
                response.sendRedirect("City.jsp");
            }
            else
            {
              String ins="insert into tbl_city(district_id,city_name)values('"+dname+"','"+city+"')";
              obj.executeCommand(ins);
            }
}
if(request.getParameter("delid")!=null)
{
    String del="delete from tbl_city where city_id='"+request.getParameter("delid")+"'";
    obj.executeCommand(del);
}
if(request.getParameter("editid")!=null)
{
    edid=request.getParameter("editid");
    String sel1="select * from tbl_city where city_id='"+edid+"'";
    ResultSet rs1=obj.selectCommand(sel1);
    if(rs1.next())
    {
        cname=rs1.getString("city_name");
        dis=rs1.getString("district_id");
    }
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>City</title>
        <%@include  file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
            <table class="table">
                <tr>
                    <input type="hidden" name="txthid" id="txthid" value="<%=edid%>">
                    <td>District</td>
                    <td><select name="slctdistrict" id="slctdistrict">
                            <option value="--select--">--Select--</option>
                            <%
                            String sel="select * from tbl_district";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("district_id")%>"<% if(rs.getString("district_id").equals(dis)){ %> selected="" <% } %>><%=rs.getString("district_name")%></option>
                            <%
                            }
                            %>
                        </select>
</td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="txtcity" id="txtcity" value="<%=cname%>"></td>
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
                                <th>District</th>
                                <th>City</th>
                                <th>Action</th>
                            </tr>
                      </thead>
                      <tbody>
                            <%
                            String sel1="select * from tbl_city p inner join tbl_district d on d.district_id=p.district_id";
                            System.out.println(sel1);
                            ResultSet rs1=obj.selectCommand(sel1);
                            int i=0;
                            while(rs1.next())
                            {
                                i++;
                                %>
                            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("city_name")%></td>
                <td><a href="City.jsp?delid=<%=rs1.getString("city_id")%>">Delete</a>
                <a href="City.jsp?editid=<%=rs1.getString("city_id")%>">Edit</a></td>
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
