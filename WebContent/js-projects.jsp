configurePopupBtn("project-menu", "myBtn");

function validateNewProject() {

	const color = [ 'yellow', 'light-green', 'dark-green', 'turquoise',
			'royal-blue', 'dark-blue', 'purple', 'pink', 'red', 'orange',
			'lighter-orange', 'orange-yellow' ];

	var value = '';

	console.log('got to validate new project');

	for (var i = 0; i < 12; i++) {
		if (document.getElementById(color[i]).checked) {
			value = document.getElementById(color[i]).value;
			console.log('The selected color is: ' + value);
		}
	}

	const url = '/Rooster/NewProject';
	const data = {
		projectTitle : document.getElementById('project-title').value,
		projectColor : value
	}

	$
			.post(url, data, null)
			.done(
					function() {
						window.location.href = "/Rooster/pem.jsp";
						console
								.log('New project implemented successfully. Response sent back correct.')
					})
			.fail(
					function() {
						document.getElementById('error-msg').innerHTML = "An error occured.";
					});
}

function openProject() {

	const color = [ 'yellow', 'light-green', 'dark-green', 'turquoise',
			'royal-blue', 'dark-blue', 'purple', 'pink', 'red', 'orange',
			'lighter-orange', 'orange-yellow' ];

	var value = '';

	console.log('got to validate new project');

	for (var i = 0; i < 12; i++) {
		if (document.getElementById(color[i]).checked) {
			value = document.getElementById(color[i]).value;
			console.log('The selected color is: ' + value);
		}
	}

	const url = '/Rooster/NewProject';
	const data = {
		projectTitle : document.getElementById('project-title').value,
		projectColor : value
	}

	$
			.post(url, data, null)
			.done(
					function() {
						window.location.href = "/Rooster/pem.jsp";
						console
								.log('New project implemented successfully. Response sent back correct.')
					})
			.fail(
					function() {
						document.getElementById('error-msg').innerHTML = "An error occured.";
					});
}