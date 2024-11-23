

<%@page import="java.util.List"%>
<%@page import="com.entity.Comments"%>
<%@page import="com.entity.item_order"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="ALL_COMPS/ALLCSS.jsp" %>
         <style>
             .x{
                 display: grid;
                 grid-template-columns: 550px 50px 400px 280px;  
                 height: 450px;
                margin-left: 150px;
             }
             .a{
                
                 margin: 20px;
                 
                
                 
                 border-style: double;
                 border-color: white;
                  
                 border-radius: 5px;                
                 
             }
             .a:hover{
               
                
             }
             .b{
                
                
             }
             .d{
                 display: grid;
                 grid-template-columns: 50% 50%;
             }
             body{
                 background-color: white;font-family: Copperplate,fantasy;
                 
             }
             h2,h4,h6{
                 margin-top: 15px;
                 margin-bottom: 15px;
                
             }
             h4{
                color:darkslateblue;
                 
             }
             h6{
                 color:rgb(239, 67, 67);
                
             }
             #snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
             
         </style>
    </head>
    <body> <c:if test ="${empty userobj}">
            <c:redirect url="../login.jsp"/>
                 </c:if>
         <%
                    String x=request.getParameter("id");
                    
                     int id=Integer.parseInt(x);
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     Items i=dao.getItemDetails(id);
                     User u=(User)session.getAttribute("userobj");
                     
                     item_order o=dao.OrderById(u.getId());
                     List<Comments> com=dao.getComments(id);
                     
                     
                     
                    
                    %>
        <%@include file="ALL_COMPS/navbar.jsp" %>
        <div class="contain-fluid" style="height: 40px; background-color: white;"></div>
        <div class="x">
            <div class="">
                <img   src="item-img/<%=i.getPhoto()  %>" alt="alt" style=" width: 100%; height:500px;  border-color: white; border-width: 3px; border-style: double;"/>
                
                
            </div>
                <div></div>
                    <div style="margin-top: 23px; "> <div>
                <h2 style="color: black;"><%=i.getDescription()%>
                </h2></div>
                        ______________________________________________
                        <div><h4 style="color: cyan;">Cash on Delivery</h4>
                <h4 style="color: darkslategrey;">PRODUCT:<%=i.getItem_name()%></h4>
                        <h2 style="color:black;"><i class="fa-solid fa-indian-rupee-sign"></i><%=i.getPrice()  %>.00</h2>
                        
                            <%
                            if(i.getStock()==0)
                            {%>
                            <h4> Out of stock</h4>
                            <%}
                            %>
                            <%
                            if(i.getStock()>0)
                            {%>
                            <h4 style="color: rgb(243, 129, 14)">Only <%=i.getStock()%> left in the stock</h4>
                            <%}
                            %>
                        
                        </div>
                            
                    </div>
            <div class="a" style="height: 330px;">
                <div style="margin-top: 25px; margin-left: 10px; ">
                <h2 style="color: black;"><i class="fa-solid fa-indian-rupee-sign"></i><%=i.getPrice()  %></h2>
               
                <h4>BRAND:<%=i.getBrand()  %></h4>
                <h4>PRODUCT:<%=i.getItem_name() %></h4>
                
                 <h6 style="color: cyan;">FREE DELIVERY</h6>
                  <h6 style="color: cyan"><i class="fa-solid fa-truck-fast"></i>delivery to-</h6>
                  <a><h6 style="color: cyan">change location?<i class="fa-solid fa-location-dot"></i></h6></a>
                          <%
                            if(i.getStock()==0)
                            {%>
                            <h4 style="color:red;"> Out of stock!</h4>
                            <%}
                            %>
                            <%
                            if(i.getStock()>0)
                            {%>
                             <div><a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-danger btn-sm abc abcd imgborder" style="margin-left: 20px;"><i class="fa-solid fa-cart-shopping" ></i>Add to cart</a><a href="buynow.jsp?id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-success btn-sm abc abcd imgborder"><i class="fa-solid fa-cart-shopping"></i>Buy Now</a></div>
                </div>
                            <%}
                            %>
               
            </div>
        </div>
                            <div>
                              <%
                              int w=0;
                              for(Comments cm:com)
                              {
                              w++;
                              }
                              %>
                                 <h4 style="margin-top: 70px; margin-left:50px;">Reviews(<%=w%>)</h4>
                                 <div style="margin-left: 55px;width :1500px;">
                                     <form action="CommentsServlet" method="post">
                                     <textarea style="width: 1300px; height: 80px; border-radius: 10px;" placeholder="add your comment" name="comment"></textarea>
                                     <input type="hidden" value="<%=i.getItem_id() %>" name="item_id">
                                     <input type="hidden" value="<%=u.getName() %>" name="name">
                                     <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong" style="margin-bottom: 30px;">Submit</button></form>
                                     <% 
                                     for(Comments cm:com)
                                     {%>
                                    <p> <i class="fa-regular fa-user" style="margin-left: 6.5px;"></i>  <%=cm.getName()%></p>
                                     <p style=" font-family: 'Poppins', sans-serif;"><%=cm.getComment() %></p>
                                     <%}
                                     
                                     %>
                                     
                                     
                                                                      
                                 </div>
                            </div>
                            <c:if test ="${not empty addCart}">
                     
                    <div id="snackbar" >${addCart}</div>
                        <body onload="myFunction();"></body>
                    
                    
                        <script>
                        function myFunction() {
                          var x = document.getElementById("snackbar");
                          x.className = "show";
                          setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
                        }
                        </script>
<c:remove var="addCart" scope="session" />  
                   
                 </c:if>
    </body>
</html>
