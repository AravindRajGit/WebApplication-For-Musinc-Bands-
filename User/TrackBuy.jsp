<%-- 
    Document   : UserBandGallery
    Created on : 27 Dec, 2019, 2:40:52 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracks Buy</title>
            <%@include file="Links.jsp" %>
         <script>
        
           
                function fnAdd(stock)
                {
                    num=document.getElementById("txtCount").value;
                    num++;
                    if(num>stock)
                    {
                        return stock;
                    }
                    else
                    {
                    count= parseInt(document.getElementById("txtCount").value=num);
                    rate=document.getElementById("txtrate").value
                    Trate=count*rate
                   // alert("Trate"+Trate)
                    document.getElementById("txtTrate").textContent=Trate
                }
       }
        
        function fnMinus(min){
            num--;
                if(num<=0)
                {
                    return min
                    
                }
                else
                {
                    
                    count= parseInt(document.getElementById("txtCount").value=num);
                    rate=document.getElementById("txtrate").value
                    Trate=count*rate
                    document.getElementById("txtTrate").textContent=Trate
       }
           
           
	}
            </script>
         <style>
        table, th, td {
            border:2px solid;
            text-align: center;
        }
        th,td {
            padding: 20px;
            background-color: none;
        }
        h1 {
           color: #000 ;
        }
        </style>
    </head>
<!---------------------------------------->    
<%
    
    if(request.getParameter("btnSave")!=null)
    {
            out.print("hii");
            String orderStock=request.getParameter("txtCount");
            String up="update tbl_tracks set track_sold='"+ orderStock +"' where track_id='"+request.getParameter("tid")+"'";
            obj.executeCommand(up);
            System.out.print(up);
            response.sendRedirect("Payment/Payment.jsp");


    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    %>
<!----------------------------------------------------->    
    
    <body>
        <%@include file="Header.jsp" %>
        
        <form method="post">
            
            <br>
        <br>
        <br>
       
        
    <center>
          <table  align="center" cellpadding="10">
        <%
            int OriginalStock=0, CurrentStock=0,SoldCount=0,BalanceCount=0;
            String tid="";
            tid=request.getParameter("tid");
            String sel="select * from tbl_tracks t inner join tbl_musicband m on m.band_id=t.band_id inner join tbl_genre g on g.genre_id=t.genre_id where t.track_id='"+tid+"' ";
            ResultSet rs=obj.selectCommand(sel);
            int i=0;
        if(rs.next())
        {
            OriginalStock=Integer.parseInt(rs.getString("track_stock"));
            SoldCount=Integer.parseInt(rs.getString("track_sold"));
            if(SoldCount==OriginalStock)
            {
               %>
               <div style="color: red;">Out Of Stock</div>
            <%    
            }
            else
            {
                BalanceCount=OriginalStock-SoldCount;
            
            %>
             <tr>
                
        <td>
            <p><img src="../MusicBand/TrackPhoto/<%=rs.getString("track_photo")%>" width="150xp" height="150xp"></p>
            <p>Track : <%=rs.getString("track_name")%></p>
            <p>Band : <%=rs.getString("band_name")%></p>
            <p>Genre : <%=rs.getString("genre_name")%></p>
            <p>Description : <%=rs.getString("track_detail")%></p>
            <p>Price : <%=rs.getString("track_price")%> <input type="hidden" name="txtrate" id="txtrate" value=" <%=rs.getString("track_price")%> "></p>
            <p>Left: <%=BalanceCount %></p>
            <p><input type="button" value="+" name="btnAdd" id="btnAdd" onclick="fnAdd(<%=rs.getString("track_stock")%>)">&nbsp;<input type="text" id="txtCount" name="txtCount" value="1">&nbsp;<input type="button" value="-" name="btnMinus" id="btnMinus" onclick="fnMinus(1)">
            <p>Total Amount:<span id="txtTrate" name="txtTrate"> <%=rs.getString("track_price")%></span></p> 
            <p align="center"> <input type="submit" name="btnSave" id="btnSave" value="Book Now"></p>
        </td>
             </tr>
           
        
   
    <%
            }  
        }
        %>
            </table>
            </center>
             </form>
           
    
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
