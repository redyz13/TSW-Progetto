<%@ page import="control.utente.Login" %>

<% Integer tipoUtente = (Integer) request.getSession().getAttribute("tipoUtente"); %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	<nav class="stickynavbar">
	<a href="#" class = "whiTee">whiTee</a>
	<a href="${pageContext.request.contextPath}/Catalogo">Home</a>
	<div class="nav-right">
	    <%-------------- Blocco utente non registrato ----------%>
	    <% if (tipoUtente == null) { %>
	    <a href="${pageContext.request.contextPath}/pages/login.jsp" id="login-icon">Login</a>
	    <% } %>
	    <%------------------------------------------------------%>
	
	    <%-------------- Blocco utente registrato ----------%>
	    <% if (tipoUtente != null && tipoUtente.equals(Login.REGISTRATO)) { %>
	    <a href="${pageContext.request.contextPath}/Logout" id="login-icon">Logout</a>
	    <% } %>
	    <%--------------------------------------------------%>
	
	    <%-------------- Blocco admin ----------%>
	    <% if (tipoUtente != null && tipoUtente.equals(Login.ADMIN)) { %>
	    <a href="${pageContext.request.contextPath}/Logout" id="">Logout</a>
	    <% } %>
	    <%--------------------------------------%>
	
	    <!-- L'admin è l'unico a non vedere il carrello -->
	    <% if (tipoUtente == null || !tipoUtente.equals(Login.ADMIN)) { %>
	    <a href="${pageContext.request.contextPath}/pages/carrello.jsp"><img src="../images/cart/cart.png"></a>
	    <% } %>
	</div>
</nav>