<%-- 
    Document   : adminnavbar
    Created on : 28 Oct 2024, 8:16:58 pm
    Author     : user
--%>

<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <c:if test ="${empty userobj}">
            <c:redirect url="../login.jsp"/>
                 </c:if>
     
        <div  style="width:100%; background-color: white; height:85px;"><h3 style="padding-top: 22px; padding-left: 10px;text-shadow: 3px 3px darkgrey; display: inline-block"><i class="fa-solid fa-futbol" ></i>SUBBY</h3>
            <c:if test="${not empty userobj}">
        <a href="login.jsp" class="btn btn-success bgg" style="margin-left:1100px; padding-top: 5px;"><i class="fas-fa-user" ></i>${userobj.name}</a>
            <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary  bgg" style="margin-right:5px;"><i class="fa-solid fa-right-from-bracket fa-text-primary "></i>logout</a>
            </c:if>
        </div>
        <!-- Button trigger modal -->


<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Do you want to logout?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../logout"><button type="button" class="btn btn-primary">Logout</button></a>
      </div>
    </div>
  </div>
</div>
         
           
        
        
        <nav class="navbar navbar-expand-lg navbar-dark  bg">
    <div class="container-fluid" style="background-color: black;">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page"  href="../index.jsp"><i class="fa-solid fa-house-chimney"></i> Home</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" aria-current="page"  href="AdminHome.jsp"><i class="fa-solid fa-house-chimney"></i>adminHome</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="../Latest.jsp"><i class="fa-regular fa-clock"></i> Latest</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../Trending.jsp"><i class="fa-solid fa-arrow-up-right-dots"></i> Trending</a> 
        </li>
      </ul>
      <form class="d-flex">
        <button class="btn btn-outline-success " type="submit"><i class="fa-solid fa-gear"></i> Settings</button>
        <button class="btn btn-outline-success" type="submit"><i class="fa-regular fa-message"></i> Contact us</button>
      </form>
    </div>
  </div>
</nav>

    </body>
    
</html>
