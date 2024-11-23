
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddBooksPage</title>
        <link rel="stylesheet" href="style.css">
         <%@include file="ALLCSS.jsp" %>
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
         
            
            
                
                     <h5 style="padding-top: 30px; margin-left: 705px;">Add Item</h5>
                     <div style="width: 800px; margin-left: 340px; margin-top: 69px;">
                          <c:if test ="${not empty succ}">
                     <h6  class="text-center text-success">${succ}</h6>
                   </c:if>
                     <c:remove var="succ" scope="session"/>
                       <c:if test ="${not empty faill}">
                     <h6  class="text-center text-danger">${faill}</h6>
                    
                     <c:remove var="faill" scope="session"/>
                     </c:if>
                 <form action="../add_items" method="post" enctype="multipart/form-data">
                   
               <div class="form-row">
    <div class="form-group col-md-6">
      <label>Item Name</label>
      <input type="text" class="form-control" id="" placeholder="" name="item_name">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Brand</label>
      <input type="text" class="form-control" id="" name="brand">
    </div>
  </div>
                     <div class="form-row">
    <div class="form-group col-md-6">
      <label>Price</label>
      <input type="number" class="form-control" id="" placeholder="" name="price">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Stock</label>
      <input type="number" class="form-control" id="" name="stock">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Description</label>
    <textarea class="form-control" name="description" maxlength="150"></textarea>
  </div>
  
  <div class="form-row">
    
    <div class="form-group col-md-6">
      <label for="inputState">Category</label>
      <select id="inputState" class="form-control" name="category">
        <option selected>Choose...</option>
        
                 <option value="cricket" >Cricket</option>
                 <option value="football">Football</option>
                 <option value="basketball">BasketBall</option>
                 <option value="tennis">Tennis</option>
                 
                 
            
      </select>
    </div>
      <div class="form-group col-md-6">
      <label for="inputState">Category</label>
      <select id="inputState" class="form-control" name="category2">
        <option selected>Choose...</option>
        
                 <option value="trending" >Trending</option>
                 <option value="latest">Latest</option>
               
                 
                 
            
      </select>
    </div>
      <div class="form-group col-md-6">
      <label for="inputPassword4">Image</label>
      <input type="file" class="form-control" id="" name="photo">
    </div>
      
    
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>



                </form>
                         </div>
            
                        <%@include file="../ALL_COMPS/footer.jsp" %>
    </body>
</html>
