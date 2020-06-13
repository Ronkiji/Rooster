package rooster.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooster.objects.*;

@WebServlet("/Navbar")
public class Navbar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Navbar() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Did it get to navbar.java?");

		String name = request.getParameter("name");
		String pfp = request.getParameter("pfp");
		String logout = request.getParameter("logout");
		String mode = request.getParameter("mode");
		System.out.println(mode);

		System.out.println("Logout is equal to " + logout);

		boolean status = false;

		HttpSession session = request.getSession();
		User user = new User();
		UserDAO userDao = new UserDAO();
		user = userDao.autofill(user, (String) session.getAttribute("username"));

		if (logout != null) {
			System.out.println("Reached if statement");
			session.invalidate();
			response.setStatus(HttpServletResponse.SC_OK);
		}

		else if (name != null) {
			System.out.println("Name change method");
			status = userDao.updateName(user, name);
			if (status == true) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else if (status == false) {
				response.sendError(401, "Update name failed");
			}
		}

		else if (pfp != null && pfp != "") {
			System.out.println("Pfp change method");
			status = userDao.updatePfp(user, pfp);
			if (status == true) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else if (status == false) {
				response.sendError(401, "Update pfp failed");
			}
		}

		else if (mode != null) {
			System.out.println("Inside the mode else if statement");
			if (mode.equals("light"))
				status = userDao.changeMode(user, 0);
			else if (mode.equals("dark")) {
				status = userDao.changeMode(user, 1);
				System.out.println("Inside the mode else if statement");
				System.out.println(status);
			} else
				status = false;

			if (status == true) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else if (status == false) {
				System.out.println("Inside the status false statement");
				response.sendError(401, "Update pfp failed");
			}
		}

		else {
			System.out.println("Inside the second status false statement");
			response.sendError(401, "Navbar request failed");
		}

	}
}
