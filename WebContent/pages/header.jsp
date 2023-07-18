<%@ page import="control.utente.Login" %>

<% Integer tipoUtente = (Integer) request.getSession().getAttribute("tipoUtente"); %>
<script type="text/javascript">
	let contextPath = '<%= request.getContextPath() %>'
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/system/favicon.ico" type="image/x-icon">
	<nav class="stickynavbar">
    <%-- TODO logo al posto della scritta --%>
    <%-- <img id="logo" src="${pageContext.request.contextPath}/images/system/logo.png" alt="whiTee"> --%>
	<a href="#" class = "whiTee a">whiTee</a>
	<a href="${pageContext.request.contextPath}/Catalogo" class="a">Home</a>
	<div class="nav-right">
	    <%-------------- Blocco utente non registrato ----------%>
	    <% if (tipoUtente == null) { %>
		<form class="searchForm">
	    	<label><input placeholder="Cerca..." class="inputSearch" name="searchText" id="searchInput" type="text"></label>
    		<button id="srcBtn">
			<%-- TODO barra di ricerca enorme --%>
			<%-- <img alt="search" src="${pageContext.request.contextPath}/images/system/search.png" id="srcImg"> --%>
    		</button>
	    </form>
	    <a href="${pageContext.request.contextPath}/pages/login.jsp" id="login-icon" class="a">Login</a>
	    <% } %>
	    <%------------------------------------------------------%>
	
	    <%-------------- Blocco utente registrato ----------%>
	    <% if (tipoUtente != null && tipoUtente.equals(Login.REGISTRATO)) { %>
	    <form class="searchForm">
	    	<input placeholder="Cerca..." class="inputSearch" name="searchText" type="text">
    		<button id="srcBtn">
			<%-- TODO barra di ricerca enorme --%>
			<%-- <img alt="search" src="${pageContext.request.contextPath}/images/system/search.png" id="srcImg"> --%>
    		</button>
	    </form>
	    <a href="${pageContext.request.contextPath}/pages/profilo.jsp" id="login-icon">Profilo</a>
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
	    
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="#">About</a>
			<a href="#">Services</a>
			<a href="#">Clients</a>
			<a href="#">Contact</a>
		</div>
		
		<div id="main">
		  	<span id="open" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
		</div>
		
		<script>
			function openNav() {
			  	document.getElementById("mySidenav").style.width = "250px";
			  	document.getElementById("main").style.marginRight = "250px";
			  	document.getElementById("open").style.display="none";
			}
			
			function closeNav() {
			  	document.getElementById("mySidenav").style.width = "0";
			  	document.getElementById("main").style.marginRight = "0";
			  	document.getElementById("open").style.display= "block";
			}
		</script>
	</div>

</nav>
<div id="risultati">
	<table>

	</table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha384-UG8ao2jwOWB7/oDdObZc6ItJmwUkR/PfMyt9Qs5AwX7PsnYn1CRKCTWyncPTWvaS" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let searchInput = document.getElementById("searchInput");
		searchInput.addEventListener("input", function () {
			let searchQuery = searchInput.value;
			let divRisultati = document.getElementById("risultati");
			if (searchQuery !== "" && searchQuery !== " ") {
				$(divRisultati).css("display", "block")
				$.ajax ({
					url: '${pageContext.request.contextPath}/SearchBar',
					type: 'POST',
					data: {search: searchQuery},
					success: function (data) {
						divRisultati.innerHTML = " "
						let jsonarray = eval(data);
						console.log(jsonarray);
						if (data.length > 0) {
							 for (let i = 0; i < jsonarray.length; i++) {
								  let obj = jsonarray[i];
								  divRisultati.innerHTML += '<td>' +'<a href="DescrizioneMaglietta?id='+ obj.ID + '">' + '<img class ="search-img" src="' + obj.grafica + '" alt="'+ obj.nome +'">' +'</a>' +'</td>';
							 }
						}
						else {
							 divRisultati.innerHTML = '<p class="nessun-articolo">'+ 'Nessun risultato trovato'+ '</p>';
						}
					},
					error: function() {
						console.log("errore");
					}
				})
			}
			else {
				$(divRisultati).css("display", "none")
			}
		})
	})
</script>