package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class LogoutServlet extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	
    	try(PrintWriter out=response.getWriter()){
    		// TODO output your page here.You may use following sample code.
        	out.println("<!DOCTYPE html>");
        	out.println("<html>");
        	out.println("<head>");
        	out.println("<title>Servlet LoginServlet</title>");
        	out.println("</head>");
        	out.println("<body>");
        	
        	HttpSession s=request.getSession();
        	s.removeAttribute("currentUser");
        	
        	Message m=new Message("Logout Successfully..", "success", "alert-success");
        	
        	s.setAttribute("msg", m);
        	
        	response.sendRedirect("login_page.jsp");
        	
        	out.println("</body>");
        	out.println("</html>");
    	}
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
