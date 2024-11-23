
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adminPage</title>
         <%@include file="ALLCSS.jsp" %>
         <link rel="stylesheet" href="style.css">
          <style>
              a{
                  text-decoration: none;
              }
              p{
                  text-decoration: none;
                  color:black;
              }
         </style>
    </head>
    <body style="font-family: impact,sans-serif;">
        <c:if test ="${empty userobj}">
            <c:redirect url="../login.jsp"/>
                 </c:if>
        <%
         User u=(User)session.getAttribute("userobj");
        if(u.getEmail()!="adminlogin@gmail.com")
        {
        response.sendRedirect("../login.jsp");
        }
        %>
        <%@include file="adminnavbar.jsp" %>
       
       
            
            
            
        <div class="container-fluid back-img">
            <div class="Latest">
                <a href="addbooks.jsp"><div class="container">
                      <div><i class="fa-solid fa-square-plus fa-10x text-success " style="width: 200px;height: 200px; border-radius: 10px; margin-left: 92px;
                              margin-top: 62px; "></i></div>
                      <div><p  style="margin-left: 122px;">Add Items<p></div>
                          
                  </div></a>
                <a href="allitems.jsp"><div class="container">
                      <div><i class="fa-solid fa-list-check fa-10x text-danger" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 92px;
                              margin-top: 60px;"></i></div>
                      <div><p  style="margin-left: 142px;" >All Items<p></div>
                          
                  </div></a> 
              
                <a href="AllOrders.jsp"><div class="container">
                      <div><i class="fa-solid fa-box-open fa-10x text-warning" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 65px;
                              margin-top: 60px; "></i></div>
                      <div><p  style="margin-left: 141px;" >Orders<p></div>
                          
                  </div></a>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal"><div class="container">
                      <div><i class="fa-solid fa-right-from-bracket fa-10x text-primary" style="width: 200px;height: 200px; border-radius: 10px; margin-left: 92px;
                              margin-top: 60px;"></i></div>
                      <div><p class="text" style="margin-left: 122px;" >Cancel Requests<p></div>
                          
                  </div></a>
                    
                 
              </div>
            
            
            
        </div> <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Do you want to logout?</h5>
       
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../logout"><button type="button" class="btn btn-primary">Logout</button></a>
      </div>
    </div>
  </div>
</div>
           
      
       
    </body>
</html>
