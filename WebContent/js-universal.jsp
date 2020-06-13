if(document.getElementsByClassName("loader-wrapper") != null){
	$(window).on("load", function () {
		$(".loader-wrapper").fadeOut("slow");
	});
}


function configurePopupBtn(popup_id, popupBtn_id) {

	const modal = document.getElementById(popup_id); // get modal

	const btn = document.getElementById(popupBtn_id); // get button id to open
	// modal

	const span = modal.getElementsByClassName("close")[0]; // 'x' button
	const cancel = modal.getElementsByClassName("cancel")[0]; // 'cancel'
	// button

	btn.onclick = function() {
		modal.style.display = "block";
		modal.className = "modal animated fadeInDown";
		if (document.getElementById("datepicker") != null)
			dateOption();
	}

	span.onclick = function() {
		modal.className = "modal animated fadeOutUp";
	}
	cancel.onclick = function() {
		modal.className = "modal animated fadeOutUp";
		if (document.getElementById("error-msg") != null) // reset 'Invalid
			// credentials' text
			// if cancelled is
			// pressed
			document.getElementById("error-msg").innerHTML = "";
	}
}

function configurePopupBtnByClassName(popup_id, popupBtn_className) {

	const modal = document.getElementById(popup_id); // get modal

	const btn = document.getElementsByClassName(popupBtn_className); // array of buttons - classname

	const span = modal.getElementsByClassName("close")[0]; // 'x' button
	const cancel = modal.getElementsByClassName("cancel")[0]; // 'cancel' button

	for (var i = 0; i < btn.length; i++) { // loops through the array to check
		btn[i].onclick = function() {

			modal.style.display = "block";
			modal.className = "modal animated fadeInDown";
		}
	}

	span.onclick = function() {
		modal.className = "modal animated fadeOutUp";
	}
	cancel.onclick = function() {
		modal.className = "modal animated fadeOutUp";
		if (document.getElementById("error-msg") != null)
			document.getElementById("error-msg").innerHTML = "";
	}
}

function dateOption() {
	var el = document.getElementById("radio-no");
	var check = false;
	if (el.checked) {
		document.getElementById("date-input").required = false;
		document.getElementById("datepicker").style.display = 'none';
		check = true;
	} else {
		document.getElementById("datepicker").style.display = '';
	}
	console.log(check);
}

var reminderId = -1;
var projectId = -1;
var jspPage;

function showModals(modal_id, id, jsp_page, element) {
	if(element === 0)
		reminderId = id;
	else if(element === 1)
		projectId = id;
	jspPage = jsp_page;
	console.log(id);
	const modal = document.getElementById(modal_id); // get modal
	modal.style.display = "block";
	modal.className = "modal animated fadeInDown";

	const span = modal.getElementsByClassName("close")[0]; // 'x' button
	const cancel = modal.getElementsByClassName("cancel")[0]; // 'cancel'
	// button
	span.onclick = function() {
		modal.className = "modal animated fadeOutUp";
	}
	cancel.onclick = function() {
		modal.className = "modal animated fadeOutUp";
		if (document.getElementById("error-msg") != null)
			document.getElementById("error-msg").innerHTML = "";
	}

}

function completeReminder() {

	const modal = document.getElementById('complete-modal');

	const url = '/Rooster/CompleteReminder';
	const data = {
		id : reminderId
	}

	$.post(url, data, null).done(function() {
		console.log("Response success completeReminder");
		modal.className = "modal animated fadeOutUp";
		$("#reminders-list").load(jspPage + " #reminders-list");
	}).fail(function() {
		// error modal
	});

	console.log('it reached the completeReminder function');
}

function deleteElement() {
	const modal = document.getElementById('delete-modal');
	const url = '/Rooster/DeleteElement';
	var data;
	var element;
	console.log('!' + reminderId);
	console.log('!' + projectId);
	if (reminderId != -1) {
		data = {
			element : 'reminder',
			id : reminderId
		}
		
		element = true;
		
	} else if(projectId != -1){
		data = {
			element : 'project',
			id : projectId
		}
		
		element = false;
	}
	
	$.post(url, data, null).done(function() {
		console.log("Response success deleteElement");
		modal.className = "modal animated fadeOutUp";
		console.log(document.getElementById("reminders-list"));
		console.log(document.getElementById("projects-list"));
		if (document.getElementById("reminders-list") != null) {
			console.log('not within the else if statement');
			$("#reminders-list").load(jspPage + " #reminders-list");
		} else if (document.getElementById("projects-list") != null) {
			console.log('within the else if statement');
			$("#projects-list").load(jspPage + " #projects-list");
		} else {
			console.log('within the else statement');
		}
	}).fail(function() {
		// error modal
	});

	console.log('it reached the completeReminder function');
}