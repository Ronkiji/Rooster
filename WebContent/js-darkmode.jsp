<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="rooster.objects.*, javax.servlet.http.HttpSession, java.sql.Date, java.time.LocalDate"%>
<%
	UserDAO userDao = new UserDAO();
	User user = new User();
	user = userDao.autofill(user, (String) session.getAttribute("username"));
%>

	
	var header2 = null;
	var paragraph = null;
	
	
	if(document.getElementById("header-2") != null)
		header2 = document.getElementById("header-2");
	if(document.getElementById("paragraph") != null)
		paragraph = document.getElementById("paragraph");

	let trans = () => {
	    console.log("Reached transition function");
	    document.documentElement.classList.add('transition');
	    window.setTimeout(() => {
	        document.documentElement.classList.remove('transition')
	    }, 200)
	}
	
	const start = <%=user.getDarkmode()%>;
	
	var currentTheme;
	if (start == 0){
	    currentTheme = 'light';
	    if(header2 != null & paragraph != null){
    		document.getElementById("header-2").innerHTML = "Dark Mode Display";
    		document.getElementById("paragraph").innerHTML = "Too bright? Let's turn it down.";
    	}	
	}
	else if (start == 1){
	    currentTheme = 'dark';
	    if(header2 != null & paragraph != null){
    		document.getElementById("header-2").innerHTML = "Light Mode Display";
    		document.getElementById("paragraph").innerHTML = "Too dark? Let's turn it up.";
    	}	
	}
	document.documentElement.setAttribute('data-theme', currentTheme);
	
	
	const btn = document.getElementsByClassName("toggle-dark-mode");
	
	for (var i = 0; i < btn.length; i++) { // loops through the array to check
	    btn[i].onclick = function() {
	        console.log('btn clicked');
	        currentTheme = invert(currentTheme);
	        document.documentElement.setAttribute('data-theme', currentTheme);
	        trans();
	        changeMode(currentTheme);
	
	    }
	}
	
	function invert(theme) {
	    if (theme == 'dark'){
	    	if(header2 != null & paragraph != null){
	    		document.getElementById("header-2").innerHTML = "Dark Mode Display";
	    		document.getElementById("paragraph").innerHTML = "Too bright? Let's turn it down.";
	    	}	
	        return 'light';
	    }
	    else if (theme == 'light')
	    	if(header2 != null & paragraph != null){
	    		document.getElementById("header-2").innerHTML = "Light Mode Display";
	    		document.getElementById("paragraph").innerHTML = "Too dark? Let's turn it up.";
	    	}	
	        return 'dark';
	}
	
	