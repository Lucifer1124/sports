

<%@page import="java.util.List"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            
            #imgid{
                width: 50px;
                height: 50px;
            }
           

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
        <table class="table">
  <thead class="thead-dark">
       <tr>
           <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Stock</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
      
    </tr>
   
  </thead>
  
      <%
      ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
      List<Items> list=dao.getAllItems();
      for(Items i : list){ %>
      
      
      <tr>
          <td><%=i.getItem_id()%></td>
          <td><img src="../item-img/<%=i.getPhoto()%>" id="imgid" alt="alt"></td>
          <td style="width: 500px;"><%=i.getItem_name() %></td>
      <td><%=i.getPrice() %></td>
      <td><%=i.getStock() %></td>
      <td><%=i.getCategory() %></td>
      <td><%=i.getCategory2()%></td>
      <td>
          <a href="ItemEditItem.jsp?id=<%=i.getItem_id()%>"  class="btn btn.sm btn-success imghover">Edit</a>
          <a href="../deleteitem?id=<%=i.getItem_id()%>"  class="btn btn.sm btn-danger imghover">Delete</a>
      </td>
    
    </tr>
      <%
          }
      
      %>
 
  
    
  
</table>
       <%@include file="../ALL_COMPS/footer.jsp" %>
    </body>
</html>
