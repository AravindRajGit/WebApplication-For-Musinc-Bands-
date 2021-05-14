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
        <style>
               body{width:610;}
               .demo-table {width: 50%;border-spacing: initial;margin: 20px 0px;word-break: break-word;table-layout: auto;line-height:1.8em;color:#333;}
               .demo-table th {background: #999;padding: 5px;text-align: left;color:#FFF;}
               .demo-table td {border-bottom: #f0f0f0 1px solid;background-color: #ffffff;padding: 5px;}
               .demo-table td div.feed_title{text-decoration: none;color:#00d4ff;font-weight:bold;}
               .demo-table ul{margin:0;padding:0;}
               .demo-table li{cursor:pointer;list-style-type: none;display: inline-block;color: #F0F0F0;text-shadow: 0 0 1px #666666;font-size:20px;}
               .demo-table .highlight, .demo-table .selected {color:#F4B30A;text-shadow: 0 0 1px #F48F0A;}
</style>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>


<script>
    
    function highlightStar(obj,id) {
//        alert("this"+obj)
//        alert("Bandid"+id)
//        alert('Hiii')
	removeHighlight(id);		
	$('.demo-table #tutorial-'+id+' li').each(function(index) {
		$(this).addClass('highlight');
		if(index === $('.demo-table #tutorial-'+id+' li').index(obj)) {
			return false;	
		}
	});
}

    
    function removeHighlight(id) {
	$('.demo-table #tutorial-'+id+' li').removeClass('selected');
	$('.demo-table #tutorial-'+id+' li').removeClass('highlight');
}


function addRating(obj,id) {
    alert("Object"+obj)
    alert("id"+id)
	$('.demo-table #tutorial-'+id+' li').each(function(index) {
		$(this).addClass('selected');
		$('#tutorial-'+id+' #rating').val((index+1));
		if(index == $('.demo-table #tutorial-'+id+' li').index(obj)) {
			return false;	
		}
	});
	$.ajax({
	url: "add_rating.jsp",
	data:'id='+id+'&rating='+$('#tutorial-'+id+' #rating').val(),
	type: "POST"
	});
}
function resetRating(id) {
	if($('#tutorial-'+id+' #rating').val() != 0) {
		$('.demo-table #tutorial-'+id+' li').each(function(index) {
			$(this).addClass('selected');
			if((index+1) == $('#tutorial-'+id+' #rating').val()) {
				return false;	
			}
		});
	}
}

    
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewBand</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br>
        <br>
        <br>
        <br>
    <center>
          <table  align="center" cellpadding="20" class="demo-table">
        <%
        String sel="select * from tbl_musicband";
        ResultSet rs=obj.selectCommand(sel);
        int i=0;
        while(rs.next())
        {
            i++;
            if(i==1)
            {
            %>
             <tr>
                 <%
                }
        %>
       
        <td>
            <p><img src="../MusicBand/Logo/<%=rs.getString("band_logo")%>" width="150" height="150"></p>
            <p>Name : <%=rs.getString("band_name")%></p>
            <p>Contact : <%=rs.getString("band_contact")%></p>
            <p>Email : <%=rs.getString("band_email")%></p>
            <p>
                <a href="BandBook.jsp?bandid=<%=rs.getString("band_id")%>" style="text-decoration: none;">Book</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="BandMembers.jsp?bandid=<%=rs.getString("band_id")%>" style="text-decoration: none;">Gems</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="UserBandGallery.jsp?bandid=<%=rs.getString("band_id")%>" style="text-decoration: none;">Gallery</a>
            </p>
            <p>
                
               
                
                <div id="tutorial-<%=rs.getString("band_id")%>">
			<input type="hidden" name="rating" id="rating" value="<%=rs.getString("band_rating")%>" />

                <ul onMouseOut="resetRating(<%=rs.getString("band_id")%>);">
                            <%
                            int j=0;
                            int rating=Integer.parseInt(rs.getString("band_rating"));
                                    for(j=1; j<=5; j++)
                                        {
                                                String selected = "";
                                                    if(rating!=0 && j<=rating) {
                                                        selected = "selected";
                                                         }
                            %>
                            <li class='<% out.print(selected); %>' onMouseOver="highlightStar(this,<%=rs.getString("band_id")%>);" onMouseOut="removeHighlight(<%=rs.getString("band_id")%>);" onClick="addRating(this,<%=rs.getString("band_id")%>);">
                                &#9733;</li>  
  <% 
  }  
  
  %>
</ul>
</div>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            </p>
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
        <%@include file="Footer.jsp" %>
    </body>
</html>
