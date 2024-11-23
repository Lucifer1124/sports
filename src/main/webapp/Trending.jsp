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
        <title>Trending Page</title>
         <%@include file="ALL_COMPS/ALLCSS.jsp" %>
         <style>
 
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
p{
    color:black;
    font-family: 'Poppins', sans-serif;
    
}
 
         </style>
      
    </head>
    <body style="
                 font-family: impact,sans-serif;
               
                 
             "><%
        User u=(User)session.getAttribute("userobj");
        
        %>
       <%@include file="ALL_COMPS/navbar.jsp" %>
       <div style="text-align: center; color: darkgray;  text-shadow: 2px 2px 2px black; margin-top:50px;"><h2><i class="fa-solid fa-arrow-up-right-dots" style="margin-right: 5px;"></i>TRENDING</h2></div>
       
       <div class="Latest">
                  <%
                  ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                  List<Items> list=dao.getAllTrendingtem();
                  for(Items i:list){%>
                  
                  <div class="container">
                      <div class="item-border"><img alt="" src="item-img/<%= i.getPhoto() %>" style="width: 200px;height: 300px; border-radius: 5px; margin-left: 35px;
                                " class="img-thumblin"></div>
                      <div class="bd" ><div></div><p class="item-border" style="margin-top: 10px; width:199px; margin-left: 38px;" ><%=i.getItem_name()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<%=i.getPrice()%>.00</p>
                
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

