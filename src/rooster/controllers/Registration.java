package rooster.controllers;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Registration() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("rname");
		String username = request.getParameter("rusername");
		String password = request.getParameter("ruserpw");
		String confirmpw = request.getParameter("rconfirmpw");
		
		User user = new User();
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setConfirmPassword(confirmpw);
		
		UserDAO userDao = new UserDAO();
		boolean status = userDao.registerUser(user);
		
		ProjectDAO projectDao = new ProjectDAO();
		Project[] projectArray = projectDao.getProjectArray(username);
		
		if(status == true) {	
			
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("username", username);
			session.setAttribute("user", user);
			session.setAttribute("projectArray", projectArray);
	
			
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}
