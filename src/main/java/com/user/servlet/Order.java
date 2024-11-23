
package com.user.servlet;

import com.DAO.ItemDaoimpl;
import com.DB.DBConnect;
import com.entity.Items;
import com.entity.item_order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "Order", urlPatterns = {"/Order"})
public class Order extends HttpServlet {


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{ HttpSession session=request.getSession();
            String user_name=request.getParameter("user_name");
          
            String landmark=request.getParameter("landmark");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            String city=request.getParameter("city");
            String payment=request.getParameter("payment");
            
            String p=request.getParameter("price");
            int price=Integer.parseInt(p);
            String y=request.getParameter("user_id");
             String z=request.getParameter("item_id");
             String item_name=request.getParameter("item_name");
             String brand=request.getParameter("brand");
             int user_id=Integer.parseInt(y);
             int item_id=Integer.parseInt(z);
             
          
            
            String fulladd=address+","+landmark+","+city+"-"+pincode;
            
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            int price2=price*quantity;
            
                     
                     ItemDaoimpl dao=new ItemDaoimpl(DBConnect.getConn());
                     item_order o=new item_order();
                     Items i=dao.getItemDetails(item_id);
                     
                    o.setUser_id(user_id);
                    o.setUser_name(user_name);
                   o.setItem_name(item_name);
                   o.setPrice(price2);
                   o.setEmail(email);
                   o.setBrand(brand);
                   o.setAdress(address);
                   o.setPincode(pincode);
                   o.setCity(city);
                   o.setPayment(payment);
                   o.setItem_id(item_id);
                   o.setQuantity(quantity);
                   if(i.getStock()>=quantity)
                   {
                        boolean f=dao.addOrder(o);
                        int w=i.getStock()-quantity;
                        boolean d=dao.stock(item_id,w);
                        response.sendRedirect("checkout.jsp?id="+o.getItem_id()+"&&user_id="+o.getUser_id() );
                        
                       
                   }
                   else{
                       
                       session.setAttribute("notenough","Not enough items left in the stock");
                       response.sendRedirect("buynow.jsp?id="+o.getItem_id()+"&&user_id="+o.getUser_id() );
                   }
                  
                  
                   
                   item_order ord=new item_order();
                   
                   
                   
                  
                     
                   
                     
                     
            
        }catch(Exception e){
            System.out.println();
            e.printStackTrace();
        }
    }

    

}
