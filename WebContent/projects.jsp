<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="rooster.objects.*, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style-colors.css" rel="stylesheet" type="text/css">
<link href="style-projects.css" rel="stylesheet" type="text/css">
<link href="style-navbar.css" rel="stylesheet" type="text/css">
<link href="animate.css" rel="stylesheet" type="text/css">
<link href="landing.jsp" type="text/html">
<link href="projects.jsp" type="text/html">
<link href="reminders.jsp" type="text/html">
<link rel="shortcut icon" href="assets/Rooster_Browser_Tab_Icon.png">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="pem.jsp" type="text/html">

<title>Rooster - Home</title>
</head>

<body>
	<%@ include file="navbar.jsp"%>

	<div id="project-menu" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span> <br>
			<h2>Make Your New Project!</h2>
			<form onsubmit="event.preventDefault(); return validateNewProject()">
				<div class="project-title-div">
					<input type="text" id="project-title" pattern="[\w\W\d\D\s]{1,40}"
						data-toggle="tooltip" data-placement="top" title="1-40 characters"
						required> <label for="project-title">Project Title</label>
				</div>

				<br> <span class="color-title">Choose Your Project's
					Color</span> <br>

				<div class="color-picker" id="colors">
					<input type="radio" name="color" id="yellow" value="#ffe600"
						required checked /> <label for="yellow"><span
						class="yellow"></span></label> <input type="radio" name="color"
						id="light-green" value="#8cc63e" /> <label for="light-green"><span
						class="light-green"></span></label> <input type="radio" name="color"
						id="dark-green" value="#00a550" /> <label for="dark-green"><span
						class="dark-green"></span></label> <input type="radio" name="color"
						id="turquoise" value="#00aaac" /> <label for="turquoise"><span
						class="turquoise"></span></label> <input type="radio" name="color"
						id="royal-blue" value="#0083ca" /> <label for="royal-blue"><span
						class="royal-blue"></span></label> <input type="radio" name="color"
						id="dark-blue" value="#005aaa" /> <label for="dark-blue"><span
						class="dark-blue"></span></label> <input type="radio" name="color"
						id="purple" value="#6f2b90" /> <label for="purple"><span
						class="purple"></span></label> <input type="radio" name="color" id="pink"
						value="#c5168c" /> <label for="pink"><span class="pink"></span></label>

					<input type="radio" name="color" id="red" value="#ed1c24" /> <label
						for="red"><span class="red"></span></label> <input type="radio"
						name="color" id="orange" value="#f05a22" /> <label for="orange"><span
						class="orange"></span></label> <input type="radio" name="color"
						id="lighter-orange" value="#f5821f" /> <label
						for="lighter-orange"><span class="lighter-orange"></span></label>
					<input type="radio" name="color" id="orange-yellow" value="#fdb813" />
					<label for="orange-yellow"><span class="orange-yellow"></span></label>
				</div>

				<div class="error-msg" id="error-msg"></div>

				<input type="submit" class="popup-buttons confirm" id="create"
					value="Create"> <input type="reset"
					class="popup-buttons cancel" value="Cancel">
			</form>
		</div>
	</div>

	<div class="options">
		<div class="interaction-option create-new-display" id="myBtn">
			<h2>Start a New Project</h2>
			<p>Click here to create your new project!</p>
		</div>

		<div onclick="location.href='help.jsp';"
			class="interaction-option help-page-display">
			<h2>New to Rooster?</h2>
			<p>Check out our help page!</p>
		</div>

		<div class="interaction-option dark-mode-display toggle-dark-mode">
			<h2 id="header-2">Dark Mode Display</h2>
			<p id="paragraph">Too bright? Let's tone it down.</p>
		</div>
	</div>

	<div class="projects-div">
		<h1>Your Projects</h1>
		<div class="size scrollbar">

			<div class="proj" id="projects-list">
				<%
					ProjectDAO projectDao = new ProjectDAO();
					Project[] projects = projectDao.getProjectArray((String) session.getAttribute("username"));
					for (int i = projects.length - 1; i >= 0; i--) {
				%>


				<a href="/Rooster/OpenProject?id=<%=projects[i].getId()%>">
					<div class="card">
						<div class="project-color"
							style="background-color:<%=projects[i].getColor()%>"></div>
						<div class="project-info">
							<h2 class="project-title"><%=projects[i].getTitle()%></h2>
						</div>
					</div>
				</a>

				<button
					onclick="event.preventDefault(); return showModals('delete-modal', <%=projects[i].getId()%>, 'projects.jsp', 1);">
					<i class="far fa-trash-alt"></i>
				</button>


				<%
					}
				%>

				<%
					if (projects.length == 0) {
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
<script type="text/javascript" src="js-projects.jsp"></script>
<script type="text/javascript" src="js-navbar.jsp"></script>

</html>