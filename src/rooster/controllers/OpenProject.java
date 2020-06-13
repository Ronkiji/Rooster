package rooster.controllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/OpenProject")
public class OpenProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OpenProject() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		
		ProjectDAO projectDao = new ProjectDAO();
		
		if(projectDao.authenticateProject(username, id)) {
			session.setAttribute("currentProjectId", id);
			System.out.println(id);
			response.sendRedirect("pem.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
}

