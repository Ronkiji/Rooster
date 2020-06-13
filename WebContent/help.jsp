<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="rooster.objects.*, javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="style-help.css" rel="stylesheet" type="text/css">
<link href="style-navbar.css" rel="stylesheet" type="text/css">
<link href="animate.css" rel="stylesheet" type="text/css">
<link href="landing.jsp" type="text/html">
<link href="projects.jsp" type="text/html">
<link href="reminders.jsp" type="text/html">
<link rel="shortcut icon" href="assets/Rooster_Browser_Tab_Icon.png">

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>Rooster - Home</title>

<link href="style-colors.css" rel="stylesheet" type="text/css">
</head>

<body>

	<%@ include file="navbar.jsp"%>


	<div class="top">
		<h1>What can we do for you?</h1>
		<p>Select one of the categories below or scroll to learn more!</p>

		<div class="anchor-box">
			<a href="#Security"> <i class="fas fa-shield-alt"></i>
				<h3>Security</h3>
			</a> <a href="#Navigation"> <i class="fas fa-compass"></i>
				<h3>Navigation</h3>
			</a>
			<div class="stack">
				<a href="#Projects"> <i class="fas fa-project-diagram spc"></i>
					<h3>Projects</h3>
				</a> <a href="#Reminders"> <i class="fas fa-tasks spc"></i>
					<h3>Reminders</h3>
				</a>
			</div>
		</div>
	</div>


	<div class="col-container">
		<h1>Frequently Asked Questions</h1>
		<h3>Click each question to see its answer!</h3>

		<div class="pad">
			<button class="accordion">I forgot my username/password,
				what do I do?</button>
			<div class="panel">
				<p>
					Email <a
						href="mailto:ssun.ronald@gmail.com?subject=Rooster Support: Username/Password"
						target="_blank">Ronald Sun</a> for your next steps.
				</p>
			</div>

			<button class="accordion">Can I change my username/password?</button>
			<div class="panel">
				<p>As of now, there is currently no way to change your username
					and password. Rooster does let you change your name and profile
					picture through the settings dropdown!</p>
			</div>

			<button class="accordion">Is it possible to receive
				notifications for my reminders?</button>
			<div class="panel">
				<p>Right now, there's no way to receive notifications for your
					reminders.</p>
			</div>

			<button class="accordion">Can I mark completed reminders
				incomplete again?</button>
			<div class="panel">
				<p>Completing a reminder permanently marks them completed. There
					is no way to undo this after you've confirmed!</p>
			</div>

			<button class="accordion">I found a bug! Who can I contact?</button>
			<div class="panel">
				<p>
					Email <a
						href="mailto:ssun.ronald@gmail.com?subject=Rooster Support: Bug"
						target="_blank">Ronald Sun</a> with all relevant information
					regarding the bug you have found.
				</p>
			</div>
		</div>

	</div>

	<div id="Security" class="more">
		<h1>Protect Your Information</h1>
		<h3>Stay safe while using Rooster.</h3>

		<div class="contact">
			<i class="fas fa-user-shield"></i>
			<div>
				<h2>User Protection</h2>
				<p>To keep your account safe, use strong passwords with mixed
					case, numbers and symbols.</p>
			</div>
		</div>

		<div class="contact">
			<i id="lock" class="fas fa-lock"></i>
			<div>
				<h2>Account Security</h2>
				<p>Keep your information safe by only logging on to our website
					where the connection is secure.</p>
			</div>
		</div>
	</div>

	<div id="Navigation" class="nav-sec">
		<br>
		<h1>Navigating in Rooster</h1>
		<h3>All of Rooster's navigation is done with the navbar.</h3>

		<div class="slideshow-container">
			<div class="slides">
				<img src="assets/Home_Slide.png" style="width: 100%">
				<div class="text">
					<h2>Home: Tab</h2>
					<p>Rooster's home page is your landing screen after logging in.
						Here, you can see some of your closest/overdue reminders and the
						other pages and features easily.</p>
				</div>
			</div>

			<div class="slides">
				<img src="assets/Projects_Slide.png" style="width: 100%">
				<div class="text">
					<h2>Projects: Tab</h2>
					<p>The Projects tab lets see all your existing projects and
						create new ones. Clicking an existing project will let you edit
						its document and create, complete or delete reminders for it.</p>
				</div>
			</div>

			<div class="slides">
				<img src="assets/Reminders_Slide.png" style="width: 100%">
				<div class="text">
					<h2>Reminders: Tab</h2>
					<p>Rooster's Reminders tab lets you see all of your reminders
						in chronological order. Upcoming and completed reminders are
						separated for your convenience!</p>
				</div>
			</div>

			<div class="slides">
				<img src="assets/Dark_Mode_slide.png" style="width: 100%">
				<div class="text">
					<h2>Dark Mode: Toggle</h2>
					<p>The Dark Mode toggle changes the color scheme of Rooster
						from light to dark. If you're not enjoying dark mode, don't worry!
						Clicking it again will switch it back.</p>
				</div>
			</div>

			<div class="slides">
				<img src="assets/Help_Slide.png" style="width: 100%">
				<div class="text">
					<h2>Help: Tab</h2>
					<p>
						Right now, you're in the help tab! Here, you can learn more about
						using Rooster. If you're having problems with the website, contact
						the developers <a>here</a>.
					</p>
				</div>
			</div>

			<div class="slides">
				<img src="assets/Settings_Slide.png" style="width: 100%">
				<div class="text">
					<h2>Settings: Dropdown Menu</h2>
					<p>The settings dropdown lets you change some of your account's
						information. This includes your name and profile picture, which
						you see on the home page! You can also logout with it.</p>
				</div>
			</div>

			<div class="arrows">
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
		</div>
		<br>

		<div>
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span> <span class="dot"
				onclick="currentSlide(4)"></span> <span class="dot"
				onclick="currentSlide(5)"></span> <span class="dot"
				onclick="currentSlide(6)"></span>
		</div>
	</div>

	<div id="Projects" class="pro-sec">
		<h1>Get Started Using Rooster</h1>
		<h3>Learn what Rooster is all about!</h3>

		<div class="step">
			<div>1</div>
			<h2>Start a Project</h2>
			<p>Go to the Projects tab and start your project!</p>
			<img src="assets/Start-project-GIF.gif">
		</div>

		<div class="step">
			<div>2</div>
			<h2>Edit Your Project</h2>
			<p>Edit the text in your document, but don't forget to press save
				after making changes!</p>
			<img src="assets/Edit-Project-GIF.gif">
		</div>

		<div class="step">
			<div>3</div>
			<h2>Set Reminders for Your Projects</h2>
			<p>Adding and managing your reminders is a great way to stay on
				track!</p>
			<img src="assets/Add-Reminder-GIF.gif">
		</div>
	</div>

	<div id="Reminders" class="rem">
		<h1>More On Reminders</h1>
		<h3>Reminders have their own unique buttons and icons!</h3>

		<div class="section">
			<img id="od" src="assets/Overdue_Icon.png">
			<div>
				<h2>Overdue Icon</h2>
				<p>Oh no- your reminder is overdue! This means that you've given
					your reminder a deadline, but you didn't mark it complete in time.
					These reminders will display at the top of all your lists to make
					sure you get to them quickly.</p>
			</div>
		</div>

		<div class="section">
			<i class="fa fa-check"></i>
			<div>
				<h2>Complete Button</h2>
				<p>Marking a reminder complete means your task has been
					finished! Rooster will move it to the bottom of your reminder list
					to make sure your upcoming reminders are at the top. Be careful
					though, once marked complete, you can't go back!</p>
			</div>
		</div>

		<div class="section">
			<i class="far fa-trash-alt tr"></i>
			<div>
				<h2>Trash Button</h2>
				<p>Deleting a reminder removes it from your lists and projects
					permanenetly! Once deleted, there is no way for a user to view the
					reminder.</p>
			</div>
		</div>

		<div class="developers">
			<div class="title">
				<h1>Contact The Developers</h1>
				<p>Email Rooster's developers for more information.</p>
			</div>
			<div>
				<div class="dev">
					<img src="assets/Cac_The_Cactus.png">
					<div>
						<h2>Nicole Raitblat</h2>
						<a href="mailto:nicole.raitblat@gmail.com?subject=Rooster Support">Email
							Nicole here</a>
					</div>
				</div>

				<div class="dev sun">
					<img id="sb">
					<div>
						<h2>Ronald Sun</h2>
						<a href="mailto:ssun.ronald@gmail.com?subject=Rooster Support">Email
							Ronald here</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<%@ include file="loader.jsp"%>
	
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js-darkmode.jsp"></script>	
<script type="text/javascript" src="js-universal.jsp"></script>
<script type="text/javascript" src="js-navbar.jsp"></script>
<script type="text/javascript" src="js-help.jsp"></script>

</html>