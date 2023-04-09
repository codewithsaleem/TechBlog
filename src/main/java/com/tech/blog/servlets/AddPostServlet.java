package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddPostServlet() {
        super();
        
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	
    	try(PrintWriter out=response.getWriter()){
             
    		int cid=Integer.parseInt(request.getParameter("cid"));
            String pTitle=request.getParameter("pTitle");
            String pContent=request.getParameter("pContent");
            String pCode=request.getParameter("pCode");
            //getting currentuser id
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("currentUser");
           // out.println("your post title is "+pTitle);
            
            Post p=new Post(pTitle, pContent, pCode, null, cid, user.getId());
            PostDao dao=new PostDao(ConnectionProvider.getConnection());
            if(dao.savePost(p)) {
            	out.println("Done...");
            }else {
            	out.println("Error...");
            }
        
    	}
    }
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws
	ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws
	ServletException, IOException {
		
		doGet(request, response);
	}

}
