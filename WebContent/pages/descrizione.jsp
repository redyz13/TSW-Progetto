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
	<tr>
		<td class="Prodotto">
			<div class="img-zoom-container">
				<img id="myimage" src="<%= magliettaBean.getGrafica() %>" alt="<%= magliettaBean.getNome() %>" class="mgt">
			  	<div id="myresult" class="img-zoom-result"></div><br><br><br><br>
			</div>
		</td>
		<td class="Descrizione">
			<br>
			<h1><%= magliettaBean.getNome() %></h1>
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
    						<script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
							<lord-icon src="https://cdn.lordicon.com/dnoiydox.json" trigger="hover" colors="primary:#1663c7,secondary:#f24c00"stroke="85"></lord-icon>
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