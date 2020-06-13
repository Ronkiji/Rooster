<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="rooster.objects.*, javax.servlet.http.HttpSession"%>

var showingSourceCode = false;
var isInEditMode = true;

<%

ProjectDAO projectDao = new ProjectDAO();
Project project = new Project();
project = projectDao.autofill(project, (int)session.getAttribute("currentProjectId"));

%>

setColors();
console.log('<%= project.getText()%>');
if('<%= project.getText()%>' != 'null'){
	HtmlToText('<%= project.getText()%>');
}

configurePopupBtn("new-reminder-modal", "modal-button");

function setColors(){
	
	var color = '<%= project.getColor()%>';

	changeColorId('title-circle', color);
	changeColorId('save-button', color);
	changeColorId('modal-button', color);
}

function changeColorId(id, color) {
	const div = document.getElementById(id);
	div.style.backgroundColor = color;
}

function enableEditMode() {
	richTextField.document.designMode = 'On';
}

function execCmd(command) {
	richTextField.document.execCommand(command, false, null);
}

function execHilite(command, option) {
	if (option === true) {
		richTextField.document.execCommand(command, false, "yellow");
	} else {
		richTextField.document.execCommand(command, false, "transparent");
	}
	console.log("Color: "
			+ richTextField.document.getSelection().backgoundColor);
	console.log(richTextField.document.getSelection().getBackgroundColor);
}

function execCommandWithArg(command, arg) {
	richTextField.document.execCommand(command, false, arg);
}

function toggleSource() {
	if (showingSourceCode) {
		richTextField.document.getElementsByTagName('body')[0].innerHTML = richTextField.document
				.getElementsByTagName('body')[0].textContent;
		showingSourceCode = false;
	} else {
		richTextField.document.getElementsByTagName('body')[0].textContent = richTextField.document
				.getElementsByTagName('body')[0].innerHTML;
		showingSourceCode = true;
	}
}

function HtmlToText(html){
	richTextField.document.getElementsByTagName('body')[0].innerHTML = html;
}

function getTextHtml(){
	return richTextField.document.getElementsByTagName('body')[0].innerHTML;
}

function getTextContent(){
	return richTextField.document.getElementsByTagName('body')[0].textContent;
}

function toggleEdit(argument) {
	if (isInEditMode) {
		richTextField.document.designMode = 'Off';
		isInEditMode = false;
	} else {
		richTextField.document.designMode = 'On';
		isInEditMode = true;
	}
}

function validateNewReminder() {

	const modal = document.getElementById("new-reminder-modal");
	
	var value = null;
	
	if(!document.getElementById("radio-no").checked){
		value = document.getElementById("date-input").value;
		console.log('Yes was selected, date inputted was ' + value);
	} else{
		console.log('No was selected, date inputted was ' + value);
	}
	
	

	const url = '/Rooster/NewReminder';
	const data = {
		reminderTitle : document.getElementById('rem-name').value,
		reminderDate : value
	}
	console.log("validateNewReminder " + document.getElementById('rem-name').value);
	console.log("validateNewReminder " + value);

	$
			.post(url, data, null)
			.done(
					function() {
						modal.className = "modal animated fadeOutUp";
						document.getElementById("new-reminder-form").reset()
						$("#reminders-list").load("pem.jsp" + " #reminders-list");
					})
			.fail(
					function() {
						document.getElementById('error-msg').innerHTML = "An error occured.";
					});

}

function saveText(){
	var title = document.getElementById('content-editable').textContent;
	console.log(title);
	
	const url = '/Rooster/SaveText';
	const data = {
		text : getTextHtml(),
		title : title 
	}

	$
			.post(url, data, null)
			.done(
					function() {						
					})
			.fail(
					function() {
						// error modal
					});
	 
}


//https://stackoverflow.com/questions/2867479/limiting-number-of-characters-in-a-contenteditable-div
var content_id = "content-editable";  

var max = 39;

document.getElementById('content-editable').addEventListener('keydown', (evt) => {
    if (evt.keyCode === 13) {
        evt.preventDefault();
    }
});

//binding keyup/down events on the contenteditable div
$('#'+content_id).keyup(function(e){ check_charcount(content_id, max, e); });
$('#'+content_id).keydown(function(e){ check_charcount(content_id, max, e); });

function check_charcount(content_id, max, e)
{   
    if(e.which != 8 && $('#'+content_id).text().length > max)
    {
       // $('#'+content_id).text($('#'+content_id).text().substring(0, max));
       e.preventDefault();
    }
}
