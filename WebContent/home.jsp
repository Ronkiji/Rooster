<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="rooster.objects.*, javax.servlet.http.HttpSession, java.sql.Date, java.time.LocalDate"%>
<!DOCTYPE html>
<html data-theme="light">

<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style-colors.css" rel="stylesheet" type="text/css">
<link href="style-home.css" rel="stylesheet" type="text/css">
<link href="style-element-modals.css" rel="stylesheet" type="text/css">
<link href="animate.css" rel="stylesheet" type="text/css">

<link href="landing.jsp" type="text/html">
<link href="projects.jsp" type="text/html">
<link href="reminders.jsp" type="text/html">
<link rel="shortcut icon" href="assets/Rooster_Browser_Tab_Icon.png">

<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<title>Rooster - Home</title>
</head>

<body>


	<%@ include file="navbar.jsp"%>

	<div class="top" id="home-greeting">
		<div class="greeting">

			<%
				UserDAO userDao = new UserDAO();
				User user = new User();
				user = userDao.autofill(user, (String) session.getAttribute("username"));

				if (user.getIcon() != null) {
			%>
			<img src=<%=user.getIcon()%>>
			<!--Input New Profile Picture Here-->

			<%
				} else {
			%>
			<img src="assets/Default_Profile_Picture.png">
			<%
				}
			%>

			<h1>
				Hi <span><%=user.getName()%></span>!
			</h1>
			<!--Input Name Here-->
			<div onclick="location.href='help.jsp';"
				class="interaction-option help-page-display">
				<h2>New to Rooster?</h2>
				<p class="noselect">Check out our help page!</p>
			</div>

			<div class="interaction-option dark-mode-display toggle-dark-mode">
				<h2 id="header-2">Dark Mode Display</h2>
				<p id="paragraph">Too bright? Let's tone it down.</p>
			</div>
		</div>

		<div class="main-page">
			<h1>Your Projects</h1>
			<a href="projects.jsp">View Projects</a> <a href="reminders.jsp">View
				Reminders</a>
		</div>
	</div>

	<div class="upcoming-display">
		<h1>Upcoming</h1>

		<div class="bg" id="reminders-list">

			<%
				ReminderDAO reminderDao = new ReminderDAO();
				reminderDao.setUser(user);
				Reminder[] reminders = reminderDao.getReminderArray(0);
				if (reminders != null) {
					ProjectDAO projectDao = new ProjectDAO();
					projectDao.setUser(user);
					Project project = new Project();
					int limit = 4;
					if (reminders.length < 4) {
						limit = reminders.length;
						System.out.println("limit is " + limit);
					}
					for (int i = 0; i < limit; i++) {
						System.out.println("project id is " + reminders[i].getProject_id());
						System.out.println(project.getTitle());
						project = projectDao.autofill(project, reminders[i].getProject_id());

						if (reminders[i].getDate() != null) {

							Date date = reminders[i].getDate();
							LocalDate localDate = date.toLocalDate();
							String zero = "";
							if (localDate.getDayOfMonth() < 10)
								zero = "0";
							String day = zero + localDate.getDayOfMonth();

							String[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
									"Dec" };
							String month = months[localDate.getMonthValue() - 1];
			%>



			<div class="in-display">



				<div class="date-display" id="date-display"
					style="background-color: <%=project.getColor()%>;">
					<h3 id="reminder-month"><%=month%></h3>
					<span id="reminder-day"><%=day%></span>


				</div>
				<div class="reminder-info">
					<h2 id="reminder-title"><%=reminders[i].getTitle()%></h2>
					<p class="project-title"><%=project.getTitle()%></p>
				</div>
				<div class="buttons">

					<%
						Date dateNow = new Date(new java.util.Date().getTime());
									if (dateNow.after(date)) {
										System.out.println("Overdue icon should be displayed");
					%>

					<img src="assets/Overdue_Icon.png">
					<%
						} else {
										System.out.println("Overdue icon should not be displayed");
					%>
					<img src="assets/Transparent_Icon.png">
					<%
						}
					%>
					<button
						onclick="event.preventDefault(); return showModals('complete-modal', <%=reminders[i].getId()%>, 'home.jsp', 0);">
						<i class="fa fa-check"></i>
					</button>
					<button class="trash-button"
						onclick="event.preventDefault(); return showModals('delete-modal', <%=reminders[i].getId()%>, 'home.jsp', 0);">
						<i class="far fa-trash-alt"></i>
					</button>
				</div>
			</div>

			<%
				} else {
			%>

			<div class="in-display">
				<div class="date-display" id="date-display"
					style="background-color: <%=project.getColor()%>;">
					<i class="far fa-calendar-minus"></i>
				</div>
				<div class="reminder-info">
					<h2><%=reminders[i].getTitle()%></h2>
					<p class="project-title"><%=project.getTitle()%></p>
				</div>
				<div class="buttons">
					<img src="assets/Transparent_Icon.png">
					<button
						onclick="event.preventDefault(); return showModals('complete-modal', <%=reminders[i].getId()%>, 'home.jsp', 0);">
						<i class="fa fa-check"></i>
					</button>
					<button class="trash-button"
						onclick="event.preventDefault(); return showModals('delete-modal', <%=reminders[i].getId()%>, 'home.jsp', 0);">
						<i class="far fa-trash-alt"></i>
					</button>
				</div>
			</div>


			<%
				}
					}
				}
			%>
			<%
				if (reminders == null) {
			%>
			<div class="empty">Nothing has been added yet.</div>

			<%
				}
			%>

		</div>
	</div>

	<%@ include file="element-modals.jsp"%>
	
	<%@ include file="loader.jsp"%>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="js-darkmode.jsp"></script>
<script type="text/javascript" src="js-universal.jsp"></script>
<script type="text/javascript" src="js-navbar.jsp"></script>

</html>

