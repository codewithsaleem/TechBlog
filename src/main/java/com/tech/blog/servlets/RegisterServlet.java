package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response, int id)
	         throws ServletException, IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			//fetch all form data
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Servlet RegisterServlet1</title>");
//			out.println("</head>");
//			out.println("<body>");
			
		//  fetch all form data	
			
			String check=request.getParameter("check");
			if (check==null) {
				out.println("box not checked");
			}else {
				
		//  baki data yaha nikalna h
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				String about=request.getParameter("about");
		
		//  create user object and set all data to that object...
				User user=new User(name, email, password, gender, about);
				
		//  create a user dao object...
				UserDao dao=new UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user)) {
					//save...
					out.println("Done");
				}else {
					out.println("Error");
				}
			}
			
//			out.println("</body>");
//			out.println("</html>");

		}
		
	}
   
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		processRequest(request, response, 0);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		processRequest(request, response, 0);
	}
    
	@Override
	public String getServletInfo() {
		return "Short Description";
		
	}
	
}
