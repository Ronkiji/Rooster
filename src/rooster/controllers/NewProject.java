package rooster.controllers;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/NewProject")
public class NewProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewProject() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("projectTitle");
		String color = request.getParameter("projectColor");
		
		Project project = new Project();
		project.setTitle(title);
		project.setColor(color);
		
		
		
		ProjectDAO projectDao = new ProjectDAO();
		HttpSession session = request.getSession();
//		Project[] projects = projectDao.getProjectArray((String)session.getAttribute("username"));
		
		System.out.println("Extracted username is: " + (String)session.getAttribute("username"));
		
		User user = new User();
		UserDAO userDao = new UserDAO();
		user = userDao.autofill(user, (String)session.getAttribute("username"));
		
		System.out.println("User's username is: " + user.getUsername());
		
		projectDao.setUser(user);
		boolean status = projectDao.createProject(project);
		
		if(status == true) {	
			
			System.out.println("Project ID is: " + project.getId());
			
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}

