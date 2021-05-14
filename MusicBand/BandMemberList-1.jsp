
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<html>
    <head>
    <%@include file="Links.jsp" %> 
    </head>
    <body>
        <%@include file="Header.jsp" %>
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
                <th> Name</th>
                <th>Gender</th>
                
                <th>Artist</th>
                <th>ArtSub</th>
                <th>Photo</th>
            </tr>
    </thead>
    <tbody>

            <%
             String sel1="select * from tbl_bandmember bm  inner join tbl_city ci on bm.city_id=ci.city_id inner join tbl_district dis on ci.district_id=dis.district_id inner join tbl_artistsubtype asub on bm.artsub_id=asub.artsub_id inner join tbl_artist ar on ar.artist_id=asub.artist_id where band_id='"+session.getAttribute("bandid")+"'";
             System.out.println(sel1);
             ResultSet rs1=obj.selectCommand(sel1);
             int i=0;
            while(rs1.next())
            {
                i++;
                        %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("bandmember_name")%></td>
                <td><%=rs1.getString("bandmember_gender")%></td>
                
                <td><%=rs1.getString("artist_name")%></td>
                <td><%=rs1.getString("artsub_name")%></td>
                <td><img src="../Musician/Photo/<%=rs1.getString("bandmember_photo")%>" width="150xp" height="150xp"></td>
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