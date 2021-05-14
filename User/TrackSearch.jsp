<%-- 
    Document   : MusicianSearch
    Created on : 31 Dec, 2019, 10:50:50 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
            <%@include file="Links.jsp" %>
            <style> 
           	 table, th, td { 
               
               
           					 } 
           		 th, td { 
               			 padding: 6px; 
                			background-color:none; 
           				 } 
              
           		 h1 { 
           				 color:green; 
            		} 
					body{
						
/*						background:url(../icons/bg2.jpg);*/
						background-size:cover;
						
						
						}
        </style> 
    </head>
    <body>
      <%@include file="Header.jsp" %>
        <form method="POST">
            
            <br>
            <br>
            <br>
            <br>
            <center>
        <table border="0" align="center" cellpadding="10">
            <tr>
                <td>Music band</td>
                        <td>
                            <select name="slctband"id="slctband">
                                <option value="0">--Select--</option>
                                    <%
                                        String sel="select * from tbl_musicband";
                                        ResultSet rs=obj.selectCommand(sel);
                                            while(rs.next())
                                                { 
                                    %>
                                                    <option value="<%=rs.getString("band_id")%>"><%=rs.getString("band_name")%></option>
                                    <%
                                                }
                                    %>
                            </select>
                        </td>
                    <td>Genre</td>
                        <td>
                            <select name="slctgenre"id="slctgenre">
                            <option value="0">--Select--</option>
                                <%
                                    String sel1="select * from tbl_genre";
                                    ResultSet rs1=obj.selectCommand(sel1);
                                    while(rs1.next())
                                        { 
                                %>
                                                <option value="<%=rs1.getString("genre_id")%>"><%=rs1.getString("genre_name")%></option>
                                <%
                                        }
                                %>
                            </select>
                        </td>
            
                        <td><input type="Submit" value="Search" name="btnsearch"></td>
            </tr>
           
        </table>
            </center>
        </form>
                <hr>
<%
    String name="",contact="",email="",photo="";
   int  band=0,genre=0;
            if(request.getParameter("btnsearch")!=null)
            {
                out.print("hii");
                band=Integer.parseInt(request.getParameter("slctband"));
                genre=Integer.parseInt(request.getParameter("slctgenre"));
                
                out.println("Band"+band);
                out.println("Genre"+genre);
                
                
                
                
                //--------------------------------------------------When Select Both Options
                
                if(band!=0 && genre!=0)
                {
       
                    out.print("Band Value"+request.getParameter("slctband"));
                    out.print("Genre Value"+request.getParameter("slctgenre"));
%>
          <table border="0" align="center" cellpadding="10">
<%
       String sel2="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id inner join tbl_musicband mb on mb.band_id=t.band_id where mb.band_id='"+band+"' and g.genre_id='"+genre+"'";
       out.print("Query-1"+sel2);
       ResultSet rs2=obj.selectCommand(sel2);
        int i=0;
        while(rs2.next())
        {
            i++;
                   %>
        <td>
                <p><img src="../MusicBand/TrackPhoto/<%=rs2.getString("track_photo")%>" width="150xp" height="150xp"></p>
                <p><%=rs2.getString("track_name")%></p>
                <p><%=rs2.getString("track_detail")%></p>
                <p><%=rs2.getString("track_price")%></p>
                <p><%=rs2.getString("genre_name")%></p>
                <p><%=rs2.getString("band_name")%></p>
        </td>
            <%
            if(i==4)
        {
        %> 
            </tr>
           <%
            i=0;
        }
    }
    }
                
                
                
             //   -----------------------------------------------------------------------------------------------------------When Select Band Only
           
             
                if(band!=0 && genre==0 )
                {
       
%>
          <table border="0" align="center" cellpadding="10">
<%
       String sel2="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id inner join tbl_musicband mb on mb.band_id=t.band_id where mb.band_id='"+band+"'";
       out.print("Query-2"+sel2);
       ResultSet rs2=obj.selectCommand(sel2);
        int i=0;
        while(rs2.next())
        {
            i++;
                   %>
        <td>
                <p><img src="../MusicBand/TrackPhoto/<%=rs2.getString("track_photo")%>" width="150xp" height="150xp"></p>
                <p><%=rs2.getString("track_name")%></p>
                <p><%=rs2.getString("track_detail")%></p>
                <p><%=rs2.getString("track_price")%></p>
                <p><%=rs2.getString("genre_name")%></p>
                <p><%=rs2.getString("band_name")%></p>
        </td>
            <%
            if(i==4)
        {
        %> 
            </tr>
           <%
            i=0;
        }
    }
    }
                
                
                
               // -----------------------------------------------------------------------------------------When Select Genre Only
                
                
                
                 
                if(genre!=0 && band==0 )
                {
       
%>
          <table border="0" align="center" cellpadding="10">
<%
       String sel3="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id inner join tbl_musicband mb on mb.band_id=t.band_id where g.genre_id='"+genre+"'";
      out.print("Query-3"+sel3);
       ResultSet rs3=obj.selectCommand(sel3);
        int i=0;
        while(rs3.next())
        {
            i++;
                   %>
        <td>
                <p><img src="../MusicBand/TrackPhoto/<%=rs3.getString("track_photo")%>" width="150xp" height="150xp"></p>
                <p><%=rs3.getString("track_name")%></p>
                <p><%=rs3.getString("track_detail")%></p>
                <p><%=rs3.getString("track_price")%></p>
                <p><%=rs3.getString("genre_name")%></p>
                <p><%=rs3.getString("band_name")%></p>
        </td>
            <%
            if(i==4)
        {
        %> 
            </tr>
           <%
            i=0;
        }
    }
    }
    
            
            }
        %>
       </table>
          </center>
          
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
       <br>
       <br>
       
        <%@include file="Footer.jsp" %>
    </body>
</html>
