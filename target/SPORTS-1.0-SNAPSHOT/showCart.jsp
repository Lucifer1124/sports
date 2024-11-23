

<%@page import="com.entity.item_order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="ALL_COMPS/ALLCSS.jsp" %>
         <style>
             .cart-grid-container{
                 margin-left: 50px;
             }
             body{
                 background-color: black;
                 
                 font-family: impact,sans-serif;
             }
             td{
                color:white;
                width: 100px;
               
             }
             .th{
                 text-shadow: 2px 2px 2px black;
             }
             tr{
                 
                 border-color: darkgrey;
                 border-style: double;
                 border-width: 3px;
             }
             tr:hover{
                 background-color: darkgrey;
                 transition-duration: 0.3s;
                 box-shadow: 5px 5px 5px black;
                 
             }
             img{
                 border-bottom-color: grey;
                 border-style: double;
             }
             table{
                
                
                 
             }
             .roww{
                 display: grid;
                 grid-template-columns: 40% ;
                color: white;
             }
             
           
             
             
         </style>
    </head>
    <body>
        <%
        User u=(User)session.getAttribute("userobj");
  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
  List<Cart> cart=dao.getItembyUserId(u.getId());
  Cart ck= new Cart();
item_order o=dao.OrderById(u.getId()); 

        %>
         <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if>
          <input type="hidden" value="${userobj.id}" name="user_id">
        
         <%@include file="ALL_COMPS/navbar.jsp" %>
         <div class="roww">
             <div class="">
         <table class="table">
               <thead class="thead-dark">
       <tr class="th">
           
      <th scope="col">Image</th>
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      
     
      <th scope="col">Action</th>
      
      
    </tr>
   
  </thead>
  <%
   int x=0;
  for(Cart c:cart)
  {%>
  <tr>
                  
                  <td><img src="item-img/<%=c.getPhoto() %>" id="imgid" alt="alt" style="height: 50px; width: 50px;"></td>
                  <td ><h4><a href="view.jsp?id=<%=c.getItem_id() %>" style="text-decoration: none; color: white;"><%=c.getItem_name()  %></a></h4></td>
          <td><h4><i class="fa-solid fa-indian-rupee-sign"></i><%=c.getTotal()%>.00</h4></td>
      
      <td><h4><%=c.getQuantity()%></h4></td>
     
      <td>
          
          <a  href="deleteCart?id=<%=c.getCart_id()%>"  class="btn btn.sm btn-danger imghover">Delete</a>
      </td>
      <%
      x=c.getTotal();
      %>
    
    </tr>
  
  
 
  
  <%}

  %>
  <tr>
      <td>Total</td>
      <td></td>
      <td></td>
      <td></td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i><%=x%>.00</td>
  </tr>
  
     
    
             
             
             
             
             
         </table>
         </div>
  <form action="orderCart" method="post">
       <div   class="col-md-11" style="margin-top: 50px; margin-right: 20px; margin-left:30px;">
           
  <div class="form-row">
      
    <div class="form-group col-md-6">
        <form action="orderCart" method="post">
       
        <input type="hidden" value="${userobj.id}" name="user_id">
       
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4"  name="user_name" value="${userobj.name}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">email</label>
      <input type="text" class="form-control" id="inputPassword4"  name="email" value="${userobj.email}">
    </div>
      <div class="form-group col-md-6">
      <label for="inputPassword4">phone number</label>
      <input type="text" class="form-control" id="inputPassword4" value="${userobj.phno}" name="phno">
    </div>
       <div class="form-group col-md-6">
      <label for="inputPassword4">landmark</label>
      <input type="text" class="form-control" id="inputPassword4" name="landmark">
    </div>
      
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" value="<%=o.getAdress() %>" name="address">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" value="<%=o.getCity() %>" id="inputCity" name="city">
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control"  value="<%=o.getPincode() %>" id="inputZip" name="pincode">
    </div>
      <div class="form-group col-md-6">
                      <select class="form-control" id="inputZip" name="payment">
                 <option selected>--select--</option>
                 
                 <option value="cod">Cash on Delivery</option>
                 
                 
                 
             </select>
                    </div>
      <div class="form-group col-md-2">
                      
                    </div>
  </div>
                    
  
    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Proceed</button>

     
  </div>
  </form>
         </div>
  
    </body>
</html>
