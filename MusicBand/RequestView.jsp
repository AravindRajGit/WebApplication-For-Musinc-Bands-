<%-- 
    Document   : RequestView
    Created on : 7 Jan, 2020, 5:55:20 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>


<%
    if(request.getParameter("aid")!=null)
    {
        String up="update tbl_request set request_status='1' where request_id='"+request.getParameter("aid")+"'";
        obj.executeCommand(up);
        out.print(up);
        
        String up1="update tbl_musician set musician_status='1' where musician_id='"+request.getParameter("mid")+"'";
        obj.executeCommand(up1);
        out.print(up1);
    }
    
    
    if(request.getParameter("rid")!=null)
    {
        String up="update tbl_request set request_status='2' where request_id='"+request.getParameter("rid")+"'";
        obj.executeCommand(up);
        out.print(up);
        
        String up1="update tbl_musician set musician_status='2' where musician_id='"+request.getParameter("mid")+"'";
        obj.executeCommand(up1);
        out.print(up1);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Pending List</p>
                  <div class="table-responsive">
        
                    <table id="recent-purchases-listing"     class="table table-hover">
                      <thead>
            <tr>
               <th>Sl.no</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Dob</th>
                <th>Address</th>
                <th>District</th>
                <th>City</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Artist</th>
                
                <th>Photo</th>
                <th>Gallery</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel1="select * from tbl_request req inner join tbl_musician mus on req.musician_id=mus.musician_id inner join tbl_city ci on mus.city_id=ci.city_id inner join tbl_district dis on  ci.district_id=dis.district_id inner join tbl_artist ar on mus.artist_id=ar.artist_id where band_id='"+session.getAttribute("bandid")+"' and req.request_status='0'";
          
           //  out.println(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int i=0;
            while(rs1.next())
            {
                i++;
             %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("musician_name")%></td>
                <td><%=rs1.getString("musician_gender")%></td>
                <td><%=rs1.getString("musician_dob")%></td>
                <td><%=rs1.getString("musician_address")%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("city_name")%></td>
                <td><%=rs1.getString("musician_contact")%></td>
                <td><%=rs1.getString("musician_email")%></td>
                <td><%=rs1.getString("artist_name")%></td>
                
                <td><img src="../Musician/Photo/<%=rs1.getString("musician_photo")%>" width="150xp" height="150xp"></td>
                <td><a href="ViewMusicianPerformance.jsp?mid=<%=rs1.getString("musician_id")%>">Gallery</a></td>
                <td>
                    <a href="RequestView.jsp?aid=<%=rs1.getString("request_id")%>&mid=<%=rs1.getString("musician_id")%>">Accept</a>
                    <br>
                    <a href="RequestView.jsp?rid=<%=rs1.getString("request_id")%>&mid=<%=rs1.getString("musician_id")%>">Reject</a></td>
                   
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
              <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Accepted List</p>
                  <div class="table-responsive">
        
                    <table id="recent-purchases-listing" class="table table-hover">
                      <thead>
            <tr>
                <th>Sl.no</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Dob</th>
                <th>Address</th>
                <th>District</th>
                <th>City</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Artist</th>
                
                <th>Photo</th>
                <th>Gallery</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel2="select * from tbl_request req inner join tbl_musician mus on req.musician_id=mus.musician_id inner join tbl_city ci on mus.city_id=ci.city_id inner join tbl_district dis on  ci.district_id=dis.district_id inner join tbl_artist ar on mus.artist_id=ar.artist_id where band_id='"+session.getAttribute("bandid")+"' and req.request_status='1'";
          
             //out.println(sel1);
             ResultSet rs2=obj.selectCommand(sel2);
             int k=0;
            while(rs2.next())
            {
                k++;
             %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("musician_name")%></td>
                <td><%=rs2.getString("musician_gender")%></td>
                <td><%=rs2.getString("musician_dob")%></td>
                <td><%=rs2.getString("musician_address")%></td>
                <td><%=rs2.getString("district_name")%></td>
                <td><%=rs2.getString("city_name")%></td>
                <td><%=rs2.getString("musician_contact")%></td>
                <td><%=rs2.getString("musician_email")%></td>
                <td><%=rs2.getString("artist_name")%></td>
                
                <td><img src="../Musician/Photo/<%=rs2.getString("musician_photo")%>" width="150xp" height="150xp"></td>
                <td><a href="ViewMusicianPerformance.jsp?mid=<%=rs2.getString("musician_id")%>">Gallery</a></td>
               
                <td><a href="RequestView.jsp?rid=<%=rs2.getString("request_id")%>">Reject</a></td>
                   
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
            <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Rejected List</p>
                  <div class="table-responsive">
        
                    <table id="recent-purchases-listing" class="table table-hover">
                      <thead>
            <tr>
                <th>Sl.no</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Dob</th>
                <th>Address</th>
                <th>District</th>
                <th>City</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Artist</th>
                
                <th>Photo</th>
                <th>Gallery</th>
                <th>Action</th>
            </tr>
                      </thead>
                      <tbody>            <%
             String sel3="select * from tbl_request req inner join tbl_musician mus on req.musician_id=mus.musician_id inner join tbl_city ci on mus.city_id=ci.city_id inner join tbl_district dis on  ci.district_id=dis.district_id inner join tbl_artist ar on mus.artist_id=ar.artist_id where band_id='"+session.getAttribute("bandid")+"' and req.request_status='2'";
          
             //out.println(sel1);
             ResultSet rs3=obj.selectCommand(sel3);
             int j=0;
            while(rs3.next())
            {
                j++;
             %>
            <tr>
                <td><%=j%></td>
                <td><%=rs3.getString("musician_name")%></td>
                <td><%=rs3.getString("musician_gender")%></td>
                <td><%=rs3.getString("musician_dob")%></td>
                <td><%=rs3.getString("musician_address")%></td>
                <td><%=rs3.getString("district_name")%></td>
                <td><%=rs3.getString("city_name")%></td>
                <td><%=rs3.getString("musician_contact")%></td>
                <td><%=rs3.getString("musician_email")%></td>
                <td><%=rs3.getString("artist_name")%></td>
                
                <td><img src="../Musician/Photo/<%=rs3.getString("musician_photo")%>" width="150xp" height="150xp"></td>
                <td><a href="ViewMusicianPerformance.jsp?mid=<%=rs3.getString("musician_id")%>">Gallery</a></td>
                <td><a href="RequestView.jsp?aid=<%=rs3.getString("request_id")%>">Accept</a></td>
                   
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
            <%@include file="Footer.jsp" %>
            
            
            
            
            
                 
                
                
                
       
       
    </body>
</html>
