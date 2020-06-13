configurePopupBtn("login-popup", "login-button"); // Show and animate login pop-up
configurePopupBtn("register-popup", "register-button"); // Show and animate registration pop-up

function validateFormLogin() {
	const url = '/Rooster/Login';
	const data = {
		lusername : document.getElementById('lusername').value,
		luserpw : document.getElementById('luserpw').value
	}

	$
			.post(url, data, null)
			// Sends request to Login.java
			.done(function() { // If response is successful
				window.location.href = "/Rooster/home.jsp";
			})
			.fail(
					function() { // If response fails
						document.getElementById('error-msg').innerHTML = "Invalid credentials";
					});

}

function validateFormRegistration() {

	const url = '/Rooster/Registration';
	const data = {
		rname : document.getElementById('rname').value,
		rusername : document.getElementById('rusername').value,
		ruserpw : document.getElementById('ruserpw').value,
		rconfirmpw : document.getElementById('rconfirmpw').value
	}

	$
			.post(url, data, null)
			.done(function() {
				window.location.href = "/Rooster/home.jsp";
			})
			.fail(
					function() {
						if (document.getElementById('ruserpw').value !== document
								.getElementById('rconfirmpw').value) {
							document.getElementById('error-msg').innerHTML = "Passwords do not match";
						} else
							document.getElementById('error-msg').innerHTML = "Username Taken";
					});
}
