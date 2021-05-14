<%-- 
    Document   : AjaxDemo
    Created on : Feb 25, 2020, 12:46:44 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Database.ConnectionClass" id="obj"></jsp:useBean>
<%
    String cid=request.getParameter("cid");
    %>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <script>
            var modal = document.getElementById("myModal");
            var span = document.getElementsByClassName("close")[0];
            span.onclick = function() {
            modal.style.display = "none";
            }
           
            window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                }
            }
        </script>
        
        
        
       
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: block; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 20%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
        
    </head>
    
    
    
    
    
    
    
    <body>
       
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <input type="hidden" name="txthid" id="txthid" value="<%= cid %>">
                <textarea name="txtReplay" id="txtReplay" rows="10" cols="10"></textarea>
                <br>
                 <input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" class="btn btn-primary mt-2 mt-xl-0">
            </div>
        </div>
    </body>
</html>
