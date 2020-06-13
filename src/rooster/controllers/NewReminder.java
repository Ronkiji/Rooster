package rooster.controllers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

import java.sql.Date;

@WebServlet("/NewReminder")
public class NewReminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewReminder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("reminderTitle");
		String dateValue = request.getParameter("reminderDate");
		Date date = null;
		
		System.out.println("DateValue is " + dateValue);
		
		if(dateValue != "") {
			 date = Date.valueOf(dateValue);
			 System.out.println("dateValue is not null");
		} else {
			System.out.println("dateValue is null");
		}
		
		HttpSession session = request.getSession();
		
		User user = new User();
		UserDAO userDao = new UserDAO();
		user = userDao.autofill(user, (String)session.getAttribute("username"));
		
		Project project = new Project();
		ProjectDAO projectDao = new ProjectDAO();
		projectDao.autofill(project, (Integer)session.getAttribute("currentProjectId"));
		
		
		Reminder reminder = new Reminder();
		reminder.setTitle(title);
		reminder.setDate(date);
		reminder.setUsername(user.getUsername());
		reminder.setProject_id((Integer)session.getAttribute("currentProjectId"));
		
		System.out.println(reminder.getTitle());
		System.out.println(reminder.getDate());
		System.out.println(user.getUsername());
		System.out.println("id#" + reminder.getProject_id());
		
		ReminderDAO reminderDao = new ReminderDAO();
		reminderDao.setUser(user);
		reminderDao.setProject(project);
		boolean status = reminderDao.createReminder(reminder);
		
		if(status = true) {
			
			response.setStatus(HttpServletResponse.SC_OK);
		} else if(status == false) {
			response.sendError(401, "Login Failed");
		}

	}
}