

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Items"%>
<%@page import="com.DAO.ItemDaoimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jsp Page</title>
         <%@include file="ALL_COMPS/ALLCSS.jsp" %>
         <style>
             .back-img{
                 
                
                 
             }
             .imgborder{
    
    border-style: double;
    border-color: black;
    border-width: 3px;
    
    
} body{
 font-family: impact,sans-serif;
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


p{
     @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
     font-family: 'Poppins', sans-serif;
}
             
         </style>
    </head>
    <body>
        <%
        User u=(User)session.getAttribute("userobj");
        
        %>
     
          <%@include file="ALL_COMPS/navbar.jsp" %>
          <div class="container-fluid back-img">
              <div style="text-align: center; color: darkgray;  text-shadow: 2px 2px 2px darkgrey;"><h2>LATEST</h2></div>
              <div class="Latest">
                  <%
                  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                  
                  List<Items> list=dao.getNewItem();
                  for(Items i:list){%>
                  
                  <div class="container">
                      <div class="imgborder" ><img alt="" src="item-img/<%= i.getPhoto() %>" style="width: 200px;height: 300px; border-radius: 5px; margin-left: 35px;
                                " class="img-thumblin "></div>
                      <div class="bd" ><div></div><p class="text-white text item-border" style="margin-top: 10px; width:199px; margin-left: 38px;" ><%=i.getItem_name()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<%=i.getPrice()%>.00</p>
                
                                </div>
                      <div class="roww">                        
                          <div><a href="view.jsp?id=<%=i.getItem_id()%>" class="btn btn-danger btn-sm abc imgborder" style="margin-left:33px;">View</a></div>
                           <%
                          if(u == null)
                          {%>
                            <div><a href="login.jsp" class="btn btn-success btn-sm abc abcd imgborder">Add to cart</a></div>                        
                          <%}      
                          %>
                           <%
                          if(u != null)
                          {%>
                          <div><a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-success btn-sm abc abcd imgborder" >Add to cart</a></div>                        
                          <%}      
                          %>
                      </div>      
                  </div>  
                  
                  
                  
                  <%}
                  
                  
                  
                  %>
                  
                  
                                    
              </div>
              <div class="heading" style="color: darkgrey;"><h2>TRENDING</h2></div>
              <div class="Latest">
                  <%
                  
                  List<Items> list2=dao.getTrendingItem();
                  for(Items i:list2){%>
                  
                  <div class="container">
                      <div><img alt="" src="item-img/<%= i.getPhoto() %>" style="width: 200px;height: 300px; border-radius: 5px; margin-left: 35px;
                                " class="img-thumblin "></div>
                      <div class="bd" ><div></div><p class="  item-border" style="margin-top: 10px; width:199px; margin-left: 38px; color:black" ><%=i.getItem_name()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<%=i.getPrice()%>.00</p>
                
                                </div>
                      <div class="roww">                        
                          <div><a href="view.jsp?id=<%=i.getItem_id()%>" class="btn btn-danger btn-sm abc imgborder" style="margin-left:33px;">View</a></div>
                           <%
                          if(u == null)
                          {%>
                            <div><a href="login.jsp" class="btn btn-success btn-sm abc abcd imgborder">Add to cart</a></div>                        
                          <%}      
                          %>
                           <%
                          if(u != null)
                          {%>
                          <div><a href="cartservlet?item_id=<%=i.getItem_id()%>&&user_id=<%=u.getId()%>" class="btn btn-success btn-sm abc abcd imgborder" >Add to cart</a></div>                        
                          <%}      
                          %>
                      </div>      
                  </div>  
                  
                  
                  
                  <%}
                  
                  
                  
                  %>
                  
                  
                                    
              </div>
               <div class="heading" style="color: darkgrey;"><h2>CATEGORIES</h2></div>
              <div class="container2">
                  <div class="container">
                      <div><a href="Cricket.jsp"><img alt="" src="img/cricket.jpg" style="width: 200px;height: 200px; border-radius: 5px; margin-left: 73px;
                                margin-top: 30px;" class="img-thumblin imghover"></a></div>
                      <div><p class="text-white text" style="margin-left: 80px; margin-top: 10px;"  >Cricket<p></div>
                           
                  </div>
                  <div class="container">
                      <div><a href="Football.jsp"><img alt="" src="img/football.jpg" style="width: 200px;height: 200px; border-radius: 5px; margin-left: 73px;
                                margin-top: 30px;" class="img-thumblin imghover"></a></div>
                      <div><p class="text-white text" style="margin-left: 80px; margin-top: 10px;"  >Football<p></div>
                          
                  </div>  
                  <div class="container">
                      <div><a href="Tennis.jsp"><img alt="" src="img/tennis.jpg" style="width: 200px;height: 200px; border-radius: 5px; margin-left: 73px;
                                margin-top: 30px;" class="img-thumblin imghover"></a></div>
                      <div><p class="text-white text"  style="margin-left: 80px; margin-top: 10px;" >Tennis<p></div>
                         
                  </div>  
                  <div class="container">
                      <div><a href="BasketBall.jsp"><img alt="" src="img/basketball.jpg" style="width: 200px;height: 200px; border-radius: 5px; margin-left: 73px;
                                margin-top: 30px;" class="img-thumblin imghover"></a></div>
                      <div><p class="text-white text" style="margin-left: 80px; margin-top: 10px;"  >BasketBall<p></div>
                       
                  </div>  
              </div>
              
              <%@include file="ALL_COMPS/footer.jsp" %>
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
