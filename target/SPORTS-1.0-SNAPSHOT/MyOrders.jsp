

<%@page import="com.entity.Items"%>
<%@page import="com.entity.item_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyOrders</title>
        <style>
             @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
            .order{
                height:280px;
                
                border-bottom-color: grey;
                border-style:solid;
                display:grid;
                grid-template-columns: 300px 1000px;
                border-top:0px;
                border-left: 0px;
                border-right: 0px;
                border-bottom: 0px;
            }
            .ord{
                margin: 10px;
                border-style: solid;
                border-color: black;
            }
           
            .ord:hover{
                              background-color: lightgray;

            }
            
            
            
            
        </style>
    </head>
    <body style=" font-family: impact,sans-serif;">
        <%@include file="ALL_COMPS/ALLCSS.jsp" %>
         <%@include file="ALL_COMPS/navbar.jsp" %>
         <% String user=request.getParameter("id");
         int user_id=Integer.parseInt(user);
         ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
          List<item_order> list=dao.OrderDetailsById(user_id);
         Items i=null;
         
         
         %>  
          <h1 style="text-align:center; margin-bottom: 30px; margin-top: 20px;">My Orders</h1>
         <%
         for(item_order o:list)
         {%>
         <%
          i=dao.getItemDetails(o.getItem_id());
         %>
        
         <div class="ord">
             
         <div class="order">
             <div>
             <img src="item-img/<%=i.getPhoto() %>" alt="alt" style="width: 200px; height: 200px; margin-left:40px;margin-top:40px;">
             </div>  
             <div>
                 
                 <h2 style="margin-top: 40px;">GM-cricket bat</h2>
                 <h4 style="font-family: 'Poppins', sans-serif;"><%=i.getDescription() %></h4>
                 <h5 style="color: grey">Quantity : <%=o.getQuantity() %></h5>
                 <h3>Price: <i class="fa-solid fa-indian-rupee-sign"></i><%=o.getPrice() %>.00</h3>
                 <%
                 if(o.getStatus().equals("Cancelled") )
                 {%>
                 <h4 class="text-danger">status-cancelled</h4>
                 <%}
                 %>
                 <%
                 if(o.getStatus().equals("OutForDelivery")||o.getStatus().equals("Shipped")||o.getStatus().equals("Delivered"))
                 {%>
                 <h4 class="text-success">status-<%=o.getStatus() %></h4>
                 <%}
                 %>
                 
             </div>
          
            
         </div>
          <%
                 if(o.getStatus().equals("OutForDelivery")||o.getStatus().equals("Shipped"))
                 {%>
                 <div  class="cancel" style="text-align: center; height:45px;  
                
              "><button style="width:100%; height:45px;" data-bs-toggle="modal" data-bs-target="#exampleModal2"><i class="fa-solid fa-xmark fa-1.7x" style="margin-top: 5px; margin-right: 5px;"></i>cancel order</button></div>
                 <%}
                 %>
         </div>
                 <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">are you sure u want to cancel this order?</h5>
       
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Yes</button>
        <a href><button type="button" class="btn btn-primary">No</button></a>
      </div>
    </div>
  </div>
</div>
         <%}
         %>
         
                 <!-- Modal -->

                
                
    </body>
</html>
