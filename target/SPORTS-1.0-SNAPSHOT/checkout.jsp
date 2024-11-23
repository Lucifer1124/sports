<%-- 
    Document   : checkout
    Created on : 8 Nov 2024, 12:12:58 am
    Author     : user
--%>

<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="ALL_COMPS/ALLCSS.jsp" %>
    </head>
    <body>
         <c:if test ="${empty userobj}">
            <c:redirect url="login.jsp"/>
                 </c:if> 
         <%
         String x=request.getParameter("id");
                    
                     int id=Integer.parseInt(x);
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     int user_id=Integer.parseInt(request.getParameter("user_id"));
                     item_order o=dao.OrderById(user_id);
        
        
        
        %>
        
      
         <%@include file="ALL_COMPS/navbar.jsp" %>
         <div class="row">
           <div class="col-md-6">
                <div class="" style="margin-left: 180px;">
                <img   src="item-img/<%=i.getPhoto()  %>" alt="alt" style=" width: 400px; height:350px;  border-color: white; border-width: 3px; border-style: double; "/>
                <h4 style="color: darkslategrey;">PRODUCT:<%=i.getItem_name()%></h4>
                
               
               
            </div>
            </div>
                <div class="col-md-5" style="margin-top: 100px;">
                    <table class="table">
  <thead>
    <tr>
      
      <th scope="col">Product</th>
      <th scope="col">price</th>
      <th scope="col">total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     
      <td><%=o.getItem_name() %>x<%=o.getQuantity() %></td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i><%=i.getPrice() %>.00</td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> <%=o.getPrice() %>.00</td>
    </tr>
    <tr>
     
      <td>Delivery </td>
      <td>free</td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> 0.00</td>
    </tr>
    <tr>
     
      <td></td>
      <td></td>
      <td><i class="fa-solid fa-indian-rupee-sign"></i> <%=o.getPrice() %>.00</td>
    </tr>
  </tbody>
</table>
    <button type="submit" class="btn btn-primary" style="margin-left:370px;">Proceed</button>
    <button type="submit" class="btn btn-danger">cancel</button>
                    
                    
                </div>
            
            
            
        </div>
                     
                 
                 
                 
             
                    
         
    </body>
</html>
