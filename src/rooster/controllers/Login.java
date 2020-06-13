package rooster.controllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("lusername");
		String password = request.getParameter("luserpw");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		UserDAO userDao = new UserDAO();
		boolean status = userDao.authenticateUser(user);
		
		if(status == true) {
			
			user = userDao.autofill(user, username);
			
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			
			response.setStatus(HttpServletResponse.SC_OK);
			
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}

