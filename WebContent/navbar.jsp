<link href="style-colors.css" rel="stylesheet" type="text/css">
<link href="style-navbar.css" rel="stylesheet" type="text/css">
<nav class="navbar">
	<input type="checkbox" id="check"> <label for="check"
		class="checkbtn"> <i class="fas fa-bars"></i>
	</label>

	<ul class="expanded-ul">
		<li class="nav-option"><a href="home.jsp"><span>Home</span><img
				src="assets/Home_Button.png" alt="Home"></a></li>
		<li class="nav-option"><a href="projects.jsp"><span>Projects</span><img
				src="assets/Projects_Button.png" alt="Projects"></a></li>
		<li class="nav-option"><a href="reminders.jsp"><span>Reminders</span><img
				src="assets/Reminders_Button.png" alt="Reminders"></a></li>

		<a class="logo-link" href="home.jsp"><img
			src="assets/Rooster_White.png" class="navbar-logo"></a>

		<li class="dropdown nav-option"><a href="javascript:void(0)"><span
				class="small-nav">Settings</span><img src="assets/Settings_Icon.png"></a>
			<div class="dropdown-content">
				<button class="dropdown-option" id="modal-button-name">Change
					Name</button>
				<button class="dropdown-option" id="modal-button-pp">Change
					Profile Picture</button>
				<button class="dropdown-option"
					onclick="event.preventDefault(); return logout()">Logout</button>
			</div></li>
		<li class="nav-option"><a href="help.jsp"><span
				class="small-nav">Help</span><img src="assets/Help_Icon.png"></a>
		</li>
		<li class="nav-option"><button class="toggle-dark-mode"><span class="small-nav">Dark Mode</span><img 
            src="assets/Dark_Mode_Icon.png"></button></li>
	</ul>

	<div id="name-modal" class="modal-nav">
		<div class="modal-content-nav">
			<span class="close">&times;</span>
			<form id="name-form"
				onsubmit="event.preventDefault(); return changeName()">
				<br>
				<h1>Change Name</h1>
				<p>Enter your new name.</p>
				<input type="text" id="name" class="nav-text" name="nav-name"
					pattern="[a-zA-Z]{1,15}" data-toggle="tooltip" data-placement="top"
					title="English alphabet only, 1-15 characters" required> <br>
				<div class="error-msg" id="error-msg"></div>
				<input type="submit" class="popup-buttons-nav confirm-nav"
					value="Confirm"> <input type="reset"
					class="popup-buttons-nav cancel" value="Cancel">
			</form>
		</div>
	</div>

	<div id="pp-modal" class="modal-nav">
		<div class="modal-content-nav">
			<span class="close">&times;</span> <br>
			<form id="pfp-form"
				onsubmit="event.preventDefault(); return changePfp()">
				<h1>Change Profile Picture</h1>
				<p>Enter the URL for your new profile picture.</p>
				<input type="text" id="pfpurl" class="nav-text" name="nav-url"
					data-toggle="tooltip" data-placement="top" title="Enter a URL"
					required> <br>
				<div class="error-msg" id="error-msg"></div>
				<input type="submit" class="popup-buttons-nav confirm-nav"
					value="Confirm"> <input type="reset"
					class="popup-buttons-nav cancel" value="Cancel">
			</form>
		</div>
	</div>
</nav>
<script type="text/javascript" src="js-universal.jsp"></script>
<script type="text/javascript" src="js-navbar.jsp"></script>