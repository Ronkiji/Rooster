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
<link href="style-pem.css" rel="stylesheet" type="text/css">
<link href="style-navbar.css" rel="stylesheet" type="text/css">
<link href="style-element-modals.css" rel="stylesheet" type="text/css">
<link href="animate.css" rel="stylesheet" type="text/css">
<link href="landing.jsp" type="text/html">
<link href="projects.jsp" type="text/html">
<link href="reminders.jsp" type="text/html">
<link rel="shortcut icon" href="assets/Rooster_Browser_Tab_Icon.png">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="pem.jsp" type="text/html">



<title>Rooster - Home</title>

<script src="https://use.fontawesome.com/aac5c45839.js"></script>
</head>

<body id="body"
	onload="event.preventDefault(); return enableEditMode();"'>
	<%@ include file="navbar.jsp"%>

	<div id="white-bg"></div>
	<div class="top-bar"></div>

	<div id="text-editor">
		<div class="typo-emph">
			<button onclick="execCmd('bold'); jQuery(this);">
				<i class="fa fa-bold"></i>
			</button>
			<button onclick="execCmd('italic');">
				<i class="fa fa-italic"></i>
			</button>
			<button onclick="execCmd('underline');">
				<i class="fa fa-underline"></i>
			</button>
			<button onclick="execCmd('strikethrough');">
				<i class="fa fa-strikethrough"></i>
			</button>
		</div>

		<div class="typo-emph div-section">
			<button onclick="execCmd('justifyLeft'); jQuery(this);">
				<i class="fa fa-align-left"></i>
			</button>
			<button onclick="execCmd('justifyCenter');">
				<i class="fa fa-align-center"></i>
			</button>
			<button onclick="execCmd('justifyRight');">
				<i class="fa fa-align-right"></i>
			</button>
		</div>

		<div class="split2">
			<div class="typo-emph">
				<button onclick="execCmd('subscript'); jQuery(this);">
					<i class="fa fa-subscript"></i>
				</button>
				<button onclick="execCmd('superscript');">
					<i class="fa fa-superscript"></i>
				</button>
			</div>

			<div class="typo-emph div-section">
				<button onclick="execCmd('undo');">
					<i class="fa fa-undo"></i>
				</button>
				<button onclick="execCmd('redo');">
					<i class="fa fa-repeat"></i>
				</button>
			</div>

			<div class="typo-emph div-section">
				<button onclick="execCmd('insertUnorderedList');">
					<i class="fa fa-list-ul"></i>
				</button>
				<button onclick="execCmd('insertOrderedList');">
					<i class="fa fa-list-ol"></i>
				</button>
			</div>
		</div>

		<div class="split1">
			<div class="typo-emph div-section font">
				<select class="font-names"
					onchange="execCommandWithArg('fontName', this.value);">
					<option id="arial" value="Arial">Arial</option>
					<option id="calibri" value="Calibri">Calibri</option>
					<option id="comic-sans-ms" value="Comic Sans MS">Comic
						Sans MS</option>
					<option id="courier" value="Courier">Courier</option>
					<option id="georgia" value="Georgia">Georgia</option>
					<option id="helvetica" value="Helvetica">Helvetica</option>
					<option id="tahoma" value="Tahoma">Tahoma</option>
					<option id="times-new-roman" value="Times New Roman">Times
						New Roman</option>
					<option id="verdana" value="Verdana">Verdana</option>
				</select> <select class="font-size"
					onchange="execCommandWithArg('fontSize', this.value);">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
				</select>
			</div>


			<div class="title">
				<div id="title-circle"></div>

				<%
					ProjectDAO projectDao = new ProjectDAO();
					Project project = new Project();
					project = projectDao.autofill(project, (int) session.getAttribute("currentProjectId"));
				%>
				<h1 class="content-editable" contenteditable="true"
					id="content-editable"><%=project.getTitle()%></h1>
			</div>

			<div class="typo-emph div-section hilite">
				<input type="color"
					onchange="execCommandWithArg('foreColor', this.value);"> <input
					type="color" class="fcol"
					onchange="execCommandWithArg('hiliteColor', this.value);">
				<button onclick="execHilite('hiliteColor', false)">
					<i class="fas fa-eraser"></i>
				</button>
			</div>

			<div class="typo-emph div-section">
				<button
					onclick="execCommandWithArg('insertImage', prompt('Enter the image URL',''));">
					<i class="fa fa-file-image-o"></i>
				</button>
			</div>
			<div class="typo-emph div-section">
				<button id="save-button"
					onclick="event.preventDefault(); return saveText();">
					<i class="fas fa-save"></i>
				</button>
			</div>
		</div>
	</div>


	<div class="text-area">
		<iframe name="richTextField"></iframe>
	</div>

	<div class="reminder-top">
		<h2>Reminders</h2>
		<button id="modal-button">
			<i class="fas fa-plus"></i>
		</button>
	</div>





	<div class="size scrollbar">

		<div id="reminders-list">


			<%
				ReminderDAO reminderDao = new ReminderDAO();
				Reminder[] remindersInc = reminderDao.getReminderArray((int) session.getAttribute("currentProjectId"), 0);
				if (remindersInc != null) {
					for (int i = 0; i < remindersInc.length; i++) {
						if (remindersInc[i].getDate() != null) {
							Date date = remindersInc[i].getDate();
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
					<h2 id="reminder-title"><%=remindersInc[i].getTitle()%></h2>
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
						onclick="event.preventDefault(); return showModals('complete-modal', <%=remindersInc[i].getId()%>, 'pem.jsp', 0);">
						<i class="fa fa-check"></i>
					</button>
					<button class="trash-button"
						onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersInc[i].getId()%>, 'pem.jsp', 0);">
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
				<div class="reminder-info-2">
					<h2 id="reminder-title"><%=remindersInc[i].getTitle()%></h2>
				</div>
				<div class="buttons">

					<img src="assets/Transparent_Icon.png">

					<button
						onclick="event.preventDefault(); return showModals('complete-modal', <%=remindersInc[i].getId()%>, 'pem.jsp', 0);">
						<i class="fa fa-check"></i>
					</button>
					<button class="trash-button"
						onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersInc[i].getId()%>, 'pem.jsp', 0);">
						<i class="far fa-trash-alt"></i>
					</button>
				</div>
			</div>

			<%
				}
					}

				}
				Reminder[] remindersCom = reminderDao.getReminderArray((int) session.getAttribute("currentProjectId"), 1);
				if (remindersCom != null) {
			%>
			<div class="completed">
				<%
					for (int j = 0; j < remindersCom.length; j++) {
							if (remindersCom[j].getDate() != null) {
								Date date = remindersCom[j].getDate();
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
					<div class="date-display"
						style="background-color: <%=project.getColor()%>;">
						<h3><%=month%></h3>
						<span><%=day%></span>
					</div>
					<div class="reminder-info">
						<h2><%=remindersCom[j].getTitle()%></h2>
					</div>
					<div class="buttons">
						<img src="assets/Transparent_Icon.png">
						<button class="checked-but">
							<i class="fa fa-check"></i>
						</button>
						<button
							onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersCom[j].getId()%>, 'pem.jsp', 0);">
							<i class="far fa-trash-alt"></i>
						</button>
					</div>
				</div>


				<%
					} else {
				%>

				<div class="in-display">
					<div class="date-display"
						style="background-color: <%=project.getColor()%>;">
						<i class="far fa-calendar-minus"></i>
					</div>
					<div class="reminder-info-2">
						<h2><%=remindersCom[j].getTitle()%></h2>
					</div>
					<div class="buttons">
						<img src="assets/Transparent_Icon.png">
						<button class="checked-but">
							<i class="fa fa-check"></i>
						</button>
						<button
							onclick="event.preventDefault(); return showModals('delete-modal', <%=remindersCom[j].getId()%>, 'pem.jsp', 0);">
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
					if (remindersInc == null && remindersCom == null) {
				%>
				<div class="empty">Nothing has been added yet.</div>

				<%
					}
				%>

			</div>


		</div>

		<div id="new-reminder-modal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span> <br>
				<h2>Create a Reminder!</h2>
				<br>
				<form id="new-reminder-form"
					onsubmit="event.preventDefault(); return validateNewReminder();">
					<div class="rem-name-div">
						<input type="text" id="rem-name" pattern="[\w\W\d\D\s]{1,25}"
							data-toggle="tooltip" data-placement="top"
							title="English alphabet only, 1-25 characters" required>
						<label for="rem-name">Reminder Title</label>
					</div>
					<br>

					<div class="pad-under">
						<span class="date-q">Add a Date?</span> <br> <label
							class="radio-inline">Yes <input type="radio"
							name="optradio" id="radio-yes" required checked
							onchange="dateOption();"> <span class="checkmark"></span>
						</label> <label class="radio-inline">No <input type="radio"
							name="optradio" id="radio-no" onchange="dateOption();"> <span
							class="checkmark"></span>
						</label>
					</div>

					<div class="pad-under" id="datepicker">
						<span class="date-q">Select a Date:</span> <br>
						<div class="datepicker">
							<input type="date" id="date-input" required>
						</div>
					</div>

					<div class="error-msg" id="error-msg"></div>

					<input type="submit" class="popup-buttons confirm" value="Create"
						id="create-button"> <input type="reset"
						class="popup-buttons cancel" value="Cancel">

				</form>
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
<script type="text/javascript" src="js-pem.jsp"></script>
<script type="text/javascript" src="js-navbar.jsp"></script>


</html>