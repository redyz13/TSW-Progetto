<%@ page import="model.maglietta.MagliettaBean" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.text.DecimalFormat" %>
<% MagliettaBean magliettaBean = (MagliettaBean) request.getAttribute("magliettaBean"); %>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/descrizione.css">
  <script src="${pageContext.request.contextPath}/js/imageZoom.js"></script>
  <script src="${pageContext.request.contextPath}/js/Modal.js"></script>
  <title>Descrizione Prodotto</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	DecimalFormat df = new DecimalFormat("#.##");
	df.setRoundingMode(RoundingMode.FLOOR);
	
	String prezzo = df.format(magliettaBean.getPrezzo());
	if (prezzo.matches("[0-9]+"))
		prezzo += ".00";

%>

<table class="mostraProdotto">
	<caption hidden>Descrizione</caption>
	<tr hidden>
		<th>Prodotto</th>
		<th>Descrizione</th>
	</tr>
	<tr>
		<td class="Prodotto">
			<div class="img-zoom-container" onclick="Modal();">
				<img id="myimage" src="<%= magliettaBean.getGrafica() %>" alt="<%= magliettaBean.getNome() %>" class="mgt">
			  	<div id="myresult" class="img-zoom-result"></div><br><br><br><br>
			  	<div id="myModal" class="modal">
					<div class="modal-content">
						<img src="<%= magliettaBean.getGrafica() %>" alt="<%= magliettaBean.getNome() %>" class="show">
					</div>
				</div>
				<script>
					document.getElementById("myModal").style.visibility = "hidden";
				</script>
			</div>
		</td>
		<td class="Descrizione">
			<br>
			<h1 class="titolo"><%= magliettaBean.getNome() %></h1>
			<br><br>
			<p><%= magliettaBean.getTipo() %><br></p>
			<p><%= magliettaBean.getDescrizione() %><br></p>
			<p>&euro;&nbsp;<%= prezzo %> + <%= magliettaBean.getIVA() %> &percnt; IVA<br></p>
			<p>Colore: <%= magliettaBean.getColore() %> <br></p>
			<br><br><br><br><br>
			<form action="${pageContext.request.contextPath}/AggiungiMaglietta" method="post">
				  <label>
					    <input type="hidden" name="ID" value="<%= magliettaBean.getID() %>">
					    <button class="btn-shine" type="submit">
    						<span>Aggiungi al carrello</span>
							<script src="https://cdn.lordicon.com/bhenfmcm.js" integrity="sha384-VY539ll5TIagHE4WlmKaJKJ4gKxfKtGxK0MgVqVuFG4RXvATOK4KWfapoPR/PE9K" crossorigin="anonymous"></script>
							<lord-icon src="https://cdn.lordicon.com/dnoiydox.json" trigger="hover" colors="primary:#1663c7,secondary:#f24c00" stroke="85"></lord-icon>
						</button>
				  </label>
			</form>
		</td>
	</tr>
</table>

<script>
// Initiate zoom effect:
document.getElementById("myresult").style.visibility = "hidden";
imageZoom("myimage", "myresult");
</script>
<%@ include file="footer.jsp" %>
</body>
</html>