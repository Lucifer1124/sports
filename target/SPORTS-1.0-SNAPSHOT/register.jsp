
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
      
           
            <style>
                @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
html,body{
  display: grid;
  height: 100%;
  width: 100%;
  place-items: center;
  background: #f2f2f2;
  /* background: linear-gradient(-135deg, #c850c0, #4158d0); */
}
::selection{
  background: #4158d0;
  color: #fff;
}
.wrapper{
  width: 380px;
  background: #fff;
  border-radius: 15px;
  box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
}
.wrapper .title{
  font-size: 35px;
  font-weight: 600;
  text-align: center;
  line-height: 100px;
  color: #fff;
  user-select: none;
  border-radius: 15px 15px 0 0;
  background: black;
  
}
.wrapper form{
  padding: 10px 30px 50px 30px;
}
.wrapper form .field{
  height: 50px;
  width: 100%;
  margin-top: 20px;
  position: relative;
}
.wrapper form .field input{
  height: 100%;
  width: 100%;
  outline: none;
  font-size: 17px;
  padding-left: 20px;
  border: 1px solid lightgrey;
  border-radius: 25px;
  transition: all 0.3s ease;
}
.wrapper form .field input:focus,
form .field input:valid{
  border-color: #4158d0;
}
.wrapper form .field label{
  position: absolute;
  top: 50%;
  left: 20px;
  color: #999999;
  font-weight: 400;
  font-size: 17px;
  pointer-events: none;
  transform: translateY(-50%);
  transition: all 0.3s ease;
}
form .field input:focus ~ label,
form .field input:valid ~ label{
  top: 0%;
  font-size: 16px;
  color: #4158d0;
  background: #fff;
  transform: translateY(-50%);
}
form .content{
  display: flex;
  width: 100%;
  height: 50px;
  font-size: 16px;
  align-items: center;
  justify-content: space-around;
}
form .content .checkbox{
  display: flex;
  align-items: center;
  justify-content: center;
}
form .content input{
  width: 15px;
  height: 15px;
  background: red;
}
form .content label{
  color: #262626;
  user-select: none;
  padding-left: 5px;
}
form .content .pass-link{
  color: "";
}
form .field input[type="submit"]{
  color: #fff;
  border: none;
  padding-left: 0;
  margin-top: -10px;
  font-size: 20px;
  font-weight: 500;
  cursor: pointer;
  background: black;
  transition: all 0.3s ease;
}
form .field input[type="submit"]:active{
  transform: scale(0.95);
}
form .signup-link{
  color: #262626;
  margin-top: 20px;
  text-align: center;
}
form .pass-link a,
form .signup-link a{
  color: #4158d0;
  text-decoration: none;
}
form .pass-link a:hover,
form .signup-link a:hover{
  text-decoration: underline;
}
h4{
   color:red;
   margin-left: 100px;
   margin-top: 15px;
}

            </style>
           
    </head>
  
      
    <body>
 
      <div class="wrapper">
         <div class="title">
            Register
         </div>
           <c:if test ="${not empty sucmsg}">
                     <h4  class="text-center text-success" style="color: green; margin-left:85px;">${sucmsg}</h4>
                    
                     <c:remove var="sucmsg" scope="session"/>
                 </c:if>
                     <c:if test ="${not empty failmsg}">
                     <h4  class="text-center text-danger">${failmsg}</h4>
                     <c:remove var="failmsg" scope="session"/>
                     
                    
                 </c:if>
                      <c:if test ="${not empty falmsg}">
                     <h6  class="text-center text-danger">${falmsg}</h6>
                     <c:remove var="falmsg" scope="session"/>
                     </c:if>
         <form action='registerservlet' method="post">
            <div class="field">
               <input type="text" required name="fname">
               <label>Full Name</label>
            </div>
             <div class="field">
               <input type="text" required name="email">
               <label>Email Address</label>
            </div>
             <div class="field">
               <input type="password" required name="password">
               <label>Password</label>
            </div>
            <div class="field">
               <input type="text" required name="phno">
               <label>Phone Number</label>
            </div>
            <div class="content">
               <div class="checkbox">
                  <input type="checkbox" name="check">
                  <c:if test ="${not empty falmsg}">
                     <h6  class="text-center text-danger">${falmsg}</h6>
                     <c:remove var="falmsg" scope="session"/>
                     </c:if>
                  <label for="remember-me">Terms & Conditions</label>
               </div>
               <div class="pass-link">
                  <a href="#">Forgot password?</a>
               </div>
            </div>
            <div class="field">
               <input type="submit" value="Login">
            </div>
            <div class="signup-link">
               Account already exists? <a href="login.jsp">Login now</a>
            </div>
         </form>
      </div>

       
   </body>
    
</html>
