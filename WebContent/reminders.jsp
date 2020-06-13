<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="rooster.objects.*, javax.servlet.http.HttpSession, java.sql.Date, java.time.LocalDate"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style-colors.css" rel="stylesheet" type="text/css">
<link href="style-reminders.css" rel="stylesheet" type="text/css">
<link href="style-navbar.css" rel="stylesheet" type="text/css">
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
	<div id="reminders-list">
		<%
			ProjectDAO projectDao = new ProjectDAO();
			Project project = new Project();
			UserDAO userDao = new UserDAO();
			User user = new User();
			user = userDao.autofill(user, (String) session.getAttribute("username"));
		%>



		<div class="upcoming">
			<h1 class="div-label">Upcoming</h1>

			<div class="size scrollbar">

				<%
					ReminderDAO reminderDao = new ReminderDAO();
					reminderDao.setUser(user);
					Reminder[] remindersInc = reminderDao.getReminderArray(0);
					if (remindersInc != null) {
						for (int i = 0; i < remindersInc.length; i++) {

							project = projectDao.autofill(project, remindersInc[i].getProject_id());

							if (remindersInc[i].getDate() != null) {
								Date date = remindersInc[i].getDate();
								LocalDate localDate = date.toLocalDate();
								String zero = "";
								if (localDate.getDayOfMonth() < 10)
									zero = "0";
								String day = zero + localDate.getDayOfMonth();

								String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
										"Dec"};
								String month = months[localDate.getMonthValue() - 1];
				%>



				<div class="in-display">



					<div class="date-display" id="date-display"
						style="background-color: <%=project.getColor()%>;">
						<h3 id="reminder-month"><%=month%></h3>
						<span id="reminder-day"><%=day%></span>


					</div>
					<div class="reminder-info">
						<h2 id="reminder-title"><%=remindersInc[i].getTitle()%></h2>
						<p><%=project.getTitle()%></p>
					</div>
					<div class="buttons">

						<%
							Date dateNow = new Date(new java.util.Date().getTime());
										if (dateNow.after(date)) {
						%>

						<img src="assets/Overdue_Icon.png">
						<%
							} else {
						%>
						<img src="assets/Transparent_Icon.png">
						<%
							}
						%>

						<button
							onclick="event.preventDefault(); return showModals('complete-modal', <%=remindersInc[i].getId()%>, 'reminders.jsp', 0);">
							<i class="fa fa-check"></i>
						</button>
						<button class="trash-button"
							onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersInc[i].getId()%>, 'reminders.jsp', 0);">
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
						<h2 id="reminder-title"><%=remindersInc[i].getTitle()%></h2>
						<p><%=project.getTitle()%></p>
					</div>
					<div class="buttons">

						<img src="assets/Transparent_Icon.png">

						<button
							onclick="event.preventDefault(); return showModals('complete-modal', <%=remindersInc[i].getId()%>, 'reminders.jsp', 0);">
							<i class="fa fa-check"></i>
						</button>
						<button class="trash-button"
							onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersInc[i].getId()%>, 'reminders.jsp', 0);">
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
				if (remindersInc == null) {
			%>
			<div class="empty">Nothing has been added yet.</div>

			<%
				}
			%>
			</div>
		</div>



		<div class="completed">
			<h1 class="div-label">Completed</h1>

			<div class="size scrollbar">

				<%
					Reminder[] remindersCom = reminderDao.getReminderArray(1);
					if (remindersCom != null) {
						for (int i = 0; i < remindersCom.length; i++) {

							project = projectDao.autofill(project, remindersCom[i].getProject_id());

							if (remindersCom[i].getDate() != null) {
								Date date = remindersCom[i].getDate();
								LocalDate localDate = date.toLocalDate();
								String zero = "";
								if (localDate.getDayOfMonth() < 10)
									zero = "0";
								String day = zero + localDate.getDayOfMonth();

								String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
										"Dec"};
								String month = months[localDate.getMonthValue() - 1];
				%>



				<div class="in-display">



					<div class="date-display" id="date-display"
						style="background-color: <%=project.getColor()%>;">
						<h3 id="reminder-month"><%=month%></h3>
						<span id="reminder-day"><%=day%></span>


					</div>
					<div class="reminder-info">
						<h2 id="reminder-title"><%=remindersCom[i].getTitle()%></h2>
						<p><%=project.getTitle()%></p>
					</div>
					<div class="buttons">

						<img src="assets/Transparent_Icon.png">

						<button class="checked-but">
							<i class="fa fa-check checked-but"></i>
						</button>
						<button onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersCom[i].getId()%>, 'reminders.jsp', 0);">
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
						<h2 id="reminder-title"><%=remindersCom[i].getTitle()%></h2>
						<p><%=project.getTitle()%></p>
					</div>
					<div class="buttons">

						<img src="assets/Transparent_Icon.png">

						<button class="checked-but">
							<i class="fa fa-check checked-but"></i>
						</button>
						<button onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersCom[i].getId()%>, 'reminders.jsp', 0);">
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
				if (remindersCom == null) {
			%>
			<div class="empty">Nothing has been added yet.</div>

			<%
				}
			%>
			</div>
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