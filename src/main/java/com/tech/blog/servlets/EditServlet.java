package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditServlet() {
        super();
       
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	
    	try(PrintWriter out=response.getWriter()){
        	out.println("<!DOCTYPE html>");
        	out.println("<html>");
        	out.println("<head>");
        	out.println("<title>Servlet LoginServlet</title>");
        	out.println("</head>");
        	out.println("<body>");
     //  fetch Data
        	String userEmail = request.getParameter("user_email");
        	String userName = request.getParameter("user_name");
     //  get the user from the session.....
        	HttpSession s=request.getSession();
        	User user=(User)s.getAttribute("currentUser");
        	user.setEmail(userEmail);
        	user.setName(userName);
     //  update database....
        	UserDao userDao=new UserDao(ConnectionProvider.getConnection());
        	boolean ans=userDao.updateUser(user);
        	if(ans) {
        		out.println("updated to db");
        	}else {
        		out.println("not updated to db");
        	}
        	
        	out.println("</body>");
        	out.println("</html>");
    	}
    }
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	    processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
