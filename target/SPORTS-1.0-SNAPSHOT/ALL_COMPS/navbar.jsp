<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User xqz =(User)session.getAttribute("userobj");
%>
<div class="container-fluid">
    <div class="row" style="background-color: white;">
        <div class="col-md-3">
            <h3 style="text-shadow: 3px 3px darkgrey;"><i class="fa-solid fa-futbol" ></i>SUBBY</h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex">
        <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search" >
        <button class="btn btn-primary my-2 my-sm-0 " type="submit">Search</button>
      </form>
        </div>
        <div class="col-md-3">
           <c:if test="${not empty userobj}">
               <a href="showCart.jsp" ><i class="fa-solid fa-cart-shopping fa-2x" style="margin-top: 15px; margin-left:80px; color:blue" ></i></a>
               <a href="login.jsp" class="btn btn-success bgg" style="margin-left: 20px; margin-bottom: 12px;  "><i class="fas-fa-user" ></i><%=xqz.getName().substring(0 , 4) %></a>
            <a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary  bgg" style="margin-right:5px;margin-bottom: 12px; color: white;"><i class="fa-solid fa-right-from-bracket fa-text-primary "></i>logout</a>
            </c:if>
            <c:if test="${empty userobj}">
         <a href="login.jsp" class="btn btn-success bgg" style="margin-left:125px;"><i class="fa-solid fa-right-to-bracket" ></i>Login</a>
            <a href="register.jsp" class="btn btn-primary  bgg" style="margin-right:5px; "><i class="fa-solid fa-right-to-bracket"></i>Register</a>
            </c:if>
            
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Do you want to logout?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="logout"><button type="button" class="btn btn-primary">Logout</button></a>
      </div>
    </div>
  </div>
</div>





<nav class="navbar navbar-expand-lg navbar-dark  bg">
    <div class="container-fluid" style="background: black;">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page"  href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Latest.jsp"><i class="fa-regular fa-clock"></i> Latest</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Trending.jsp"><i class="fa-solid fa-arrow-up-right-dots"></i> Trending</a> 
        </li>
       
      </ul>
      <form class="d-flex">
        <button class="btn btn-outline-success " type="submit"><i class="fa-solid fa-gear"></i> Settings</button>
        <button class="btn btn-outline-success" type="submit"><i class="fa-regular fa-message"></i> Contact us</button>
      </form>
    </div>
  </div>
</nav>
