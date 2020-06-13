<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="rooster.objects.*, javax.servlet.http.HttpSession"%>

function logout(){
	<%
	session.invalidate();
	%>
	window.location.href = "/Rooster/landing.jsp";

}