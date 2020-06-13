package rooster.controllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rooster.objects.*;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/DeleteElement")
public class DeleteElement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteElement() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("id"));
		String element =(String)(request.getParameter("element"));
		ReminderDAO reminderDao = new ReminderDAO();
		ProjectDAO projectDao = new ProjectDAO();
		boolean status = false;
		
		System.out.println("element is " + element);
		
		if(element.equals("reminder")) {
			System.out.println("It is in the delete reminder if statement.");
			status = reminderDao.deleteReminder(id);
		} else if(element.equals("project")) {
			System.out.println("It is in the delete reminder else if statement.");
			reminderDao.deleteReminderByProject(id);
			status = projectDao.deleteProject(id);
		} else {
			System.out.println("It is in the delete reminder else statement.");
			status = false;
		}
		
		
		if(status == true) {
			System.out.println("status is " + status);
			System.out.println("Status true");
			response.setStatus(HttpServletResponse.SC_OK);
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}