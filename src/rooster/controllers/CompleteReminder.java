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
@WebServlet("/CompleteReminder")
public class CompleteReminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompleteReminder() {
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
		ReminderDAO reminderDao = new ReminderDAO();
		boolean status = reminderDao.completeReminder(id);
		
		if(status = true) {
			System.out.println("Status true");
			response.setStatus(HttpServletResponse.SC_OK);
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}
	}
}