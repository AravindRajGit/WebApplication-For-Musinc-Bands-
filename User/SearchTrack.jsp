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
        <meta http-equiv="Content-Type" content="text/html"; charset=UTF-8">
        <title>Search track</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <form method="post">
        <table border="0" align="center" cellpadding="10">
            <tr>
                <td>Music band</td>
                        <td><select name="slctband"id="slctband">
                    <option value="1">--Select--</option>
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
                    </select></td>
            
                <td>Genre</td>
                        <td><select name="slctgenre"id="slctgenre">
                    <option value="1">--Select--</option>
                <%
                String select="select * from tbl_genre";
                ResultSet rsect=obj.selectCommand(select);
                while(rsect.next())
                { 
                %>
                <option value="<%=rsect.getString("genre_id")%>"><%=rsect.getString("genre_name")%></option>
                <%
                }
                %>
                    </select></td>
            <tr>
                <td colspan="2"><div align="right"><input type="Submit" value="Search" name="btnsearch"></div></td>
            </tr>
            </tr>
        </table>
        </form>
<%
    String name="",contact="",email="",photo="",band="",genre="";
    if(request.getParameter("btnsearch")!=null)
    { 
                                if(request.getParameter("slctband")!=null && request.getParameter("slctgenre")!=null)
                                {
                                            band=request.getParameter("slctband");
                                            genre=request.getParameter("slctgenre");
                                           %>
                                                       <table border="0" align="center" cellpadding="10">
                                            <%
                                                    String sel1="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id where t.band_id='"+band+"' and t.genre_id='"+genre+"'";
                                                    System.out.print(sel1);
                                                    ResultSet rs1=obj.selectCommand(sel1);
                                                    int i=0;
                                                    while(rs1.next())
                                                        {
                                                            i++;
                                            %>

                                            <td>
                                                    <p><img src="../Music Band/TrackPhoto/<%=rs1.getString("track_photo")%>" width="150xp" height="150xp"></p>
                                                    <p><%=rs1.getString("track_name")%></p>
                                                    <p><%=rs1.getString("genre_name")%></p>
                                                    <p><%=rs1.getString("track_detail")%></p>
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
                                
                                
                                if(request.getParameter("slctgenre")!=null)
                                {
                                            genre=request.getParameter("slctgenre");
                                        
                                           %>
                                                       <table border="0" align="center" cellpadding="10">
                                            <%
                                                    String sel1="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id where t.genre_id='"+genre+"'";
                                                    System.out.print(sel1);
                                                    ResultSet rs1=obj.selectCommand(sel1);
                                                    int i=0;
                                                    while(rs1.next())
                                                        {
                                                            i++;
                                            %>

                                            <td>
                                                    <p><img src="../Music Band/TrackPhoto/<%=rs1.getString("track_photo")%>" width="150xp" height="150xp"></p>
                                                    <p><%=rs1.getString("track_name")%></p>
                                                    <p><%=rs1.getString("genre_name")%></p>
                                                    <p><%=rs1.getString("track_detail")%></p>
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
                                
                                
                                
                                 if(request.getParameter("slctband")!=null)
                                {
                                            band=request.getParameter("slctband");
                                        
                                           %>
                                                       <table border="0" align="center" cellpadding="10">
                                            <%
                                                    String sel1="select * from tbl_tracks t inner join tbl_genre g on g.genre_id=t.genre_id where t.band_id='"+band+"'";
                                                    System.out.print(sel1);
                                                    ResultSet rs1=obj.selectCommand(sel1);
                                                    int i=0;
                                                    while(rs1.next())
                                                        {
                                                            i++;
                                            %>

                                            <td>
                                                    <p><img src="../Music Band/TrackPhoto/<%=rs1.getString("track_photo")%>" width="150xp" height="150xp"></p>
                                                    <p><%=rs1.getString("track_name")%></p>
                                                    <p><%=rs1.getString("genre_name")%></p>
                                                    <p><%=rs1.getString("track_detail")%></p>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
