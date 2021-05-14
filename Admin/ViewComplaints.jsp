<%-- 
    Document   : MusicBandList-New
    Created on : 10 Dec, 2019, 11:06:38 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
    boolean b;
    if(request.getParameter("rid")!=null)
    {
        String up="update tbl_musicband set band_status='2' where band_id='"+request.getParameter("rid")+"'";
        obj.executeCommand(up);
    }
    
    if(request.getParameter("btnsubmit")!=null)
    {
      String Complaintid=request.getParameter("txthid");
      String Reply=request.getParameter("txtReplay");
      
      String up="update tbl_complaints set complaint_reply='"+ Reply +"',complaint_status='1' where complaint_id='"+Complaintid+"'";
     b= obj.executeCommand(up);
      out.print(up);
      out.print(b);
      
      %>
       <script>alert('Replay Send')</script>
      
      
      <%
      
    
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted List</title>
        <script src="JQ/jq.js"></script>
        <script>
                    function sendReplay(cid)
                    {
                       // alert("hii")
                        $.ajax({url: 'AjaxDemo.jsp?cid='+cid,
                        type: 'GET',
                        success: function(data) {
                         //   alert("Data"+data)
                        $('#demo').html(data);
                        },
                        });
                    }
        </script>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        
         <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">User Complaints</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
            <tr>
                  <th>Sl.No</th>
                <th>Caption</th>
                <th>Content</th>
                <th>Complaint By</th>
                <th>Action</th>
                
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel="select * from tbl_complaints com inner join tbl_user usr on com.user_id=usr.user_id where com.user_id <>0  and complaint_status='0'";
             ResultSet rs=obj.selectCommand(sel);
             int i=0;
            while(rs.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("complaint_caption")%></td>
                <td><%=rs.getString("complaint_desc")%></td>
                <td><%=rs.getString("user_name")%></td>
                 <td><input type="button" value="Reply" class="btn btn-primary mt-2 mt-xl-0" onclick="sendReplay(<%=rs.getString("complaint_id")%>)"></td>
               
               
               
                
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
        
        
        <br>
        <br>
        <br>
        <br>
        
        
        <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Band Complaints</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
            <tr>
                <th>Sl.No</th>
                <th>Caption</th>
                <th>Content</th>
                <th>Complaint By</th>
                <th>Action</th>
                
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel1="select * from tbl_complaints com inner join tbl_musicband mb on com.band_id=mb.band_id where com.band_id <>0 and complaint_status='0' ";
             ResultSet rs1=obj.selectCommand(sel1);
             int j=0;
            while(rs1.next())
            {
                j++;
                        %>
            <tr>
                <td><%=j%></td>
                <td><%=rs1.getString("complaint_caption")%></td>
                <td><%=rs1.getString("complaint_desc")%></td>
                <td><%=rs1.getString("band_name")%></td>
                 <td><input type="button" value="Reply" class="btn btn-primary mt-2 mt-xl-0" onclick="sendReplay(<%=rs1.getString("complaint_id")%>)"></td>
               
               
               
                
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
                  <p class="card-title">Musician Complaints</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
            <tr>
                <th>Sl.No</th>
                <th>Caption</th>
                <th>Content</th>
                <th>Complaint By</th>
                <th>Action</th>
                
            </tr>
                      </thead>
                      <tbody>
            <%
             String sel2="select * from tbl_complaints com inner join tbl_musician mb on com.musician_id=mb.musician_id where com.musician_id <>0 and complaint_status='0' ";
             ResultSet rs2=obj.selectCommand(sel2);
             int k=0;
            while(rs2.next())
            {
                k++;
                        %>
            <tr>
                <td><%=k%></td>
                <td><%=rs2.getString("complaint_caption")%></td>
                <td><%=rs2.getString("complaint_desc")%></td>
                <td><%=rs2.getString("musician_name")%></td>
                <td><input type="button" value="Reply" class="btn btn-primary mt-2 mt-xl-0" onclick="sendReplay(<%=rs2.getString("complaint_id")%>)"></td>
               
               
                
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
        <form>
        <div id="demo"></div>
        
        
        </form>
            <%@include file="Footer.jsp" %>
    </body>
</html>
