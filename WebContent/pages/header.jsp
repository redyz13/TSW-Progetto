<%@ page import="control.utente.Login" %>

<% Integer tipoUtente = (Integer) request.getSession().getAttribute("tipoUtente"); %>
<script type="text/javascript">
	let contextPath = '<%= request.getContextPath() %>'
</script>
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
			<script src="https://cdn.lordicon.com/bhenfmcm.js" integrity="sha384-VY539ll5TIagHE4WlmKaJKJ4gKxfKtGxK0MgVqVuFG4RXvATOK4KWfapoPR/PE9K" crossorigin="anonymous"></script>
	    	<lord-icon src="https://cdn.lordicon.com/lpddubrl.json" trigger="hover" colors="primary:#e88c30,secondary:#30c9e8" stroke="85" class="cart" onclick="location.href = '${pageContext.request.contextPath}/pages/carrello.jsp';"></lord-icon>
	    <% } %>
	</div>
</nav>