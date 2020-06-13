package rooster.controllers;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/SaveText")
public class SaveText extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveText() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String text = request.getParameter("text");
		String title = request.getParameter("title");
		
		
		ProjectDAO projectDao = new ProjectDAO();
		Project project = new Project();
		HttpSession session = request.getSession();
		project = projectDao.autofill(project, (int)session.getAttribute("currentProjectId"));

		
		User user = new User();
		UserDAO userDao = new UserDAO();
		user = userDao.autofill(user, (String)session.getAttribute("username"));
		
		projectDao.setUser(user);
		boolean status = projectDao.saveText(project, text);
		boolean status2 = projectDao.updateTitle(project, title);
		
		if(status == true && status2 == true) {	
			response.setStatus(HttpServletResponse.SC_OK);
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}

