<%@ page import="java.util.Collection" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="model.maglietta.MagliettaBean" %>

<% Collection<?> magliette = (Collection<?>) request.getAttribute("magliette");
  if (magliette == null)
    response.sendRedirect("./Catalogo");
%>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/index.css">
  <title>Home</title>
</head>

<body>
  <%@ include file="pages/header.jsp" %>
  <h1> <a href="Catalogo">Magliette</a> </h1>
  <div class="dropdown b">
  	<button class="dropbtn">Ordina per &dtrif;</button>
    <div class="dropdown-content">
    	<a href="Catalogo?ordine=nome">Nome</a>
    	<a href="Catalogo?ordine=prezzo">Prezzo</a>
    	<a href="Catalogo?ordine=colore">Colore</a>
    	<a href="Catalogo?ordine=tipo">Tipo</a>
    </div>
  </div>
  <br>
  <div class="magliette">
    <%
 // Formatter per il prezzo
    if (magliette != null && magliette.size() != 0) {
      DecimalFormat df = new DecimalFormat("#.##");
      df.setRoundingMode(RoundingMode.FLOOR);

      // Stampa catalogo
      for (Object o : magliette) {
        MagliettaBean maglietta = (MagliettaBean) o;
        String prezzo = df.format(maglietta.getPrezzo());

        if (prezzo.matches("[0-9]+"))
          prezzo += ".00";
    %>
    	<div class="elemento">
	    	<table class="dettagli">
	    		<tr>
	    			<td colspan="2" class="maglietta">
	    				<img src="<%= maglietta.getGrafica() %>" alt="<%= maglietta.getNome() %>">
	    			</td>
	    		</tr>
	    		<tr>
		    		<td colspan="2">
		    			<%= maglietta.getTipo() %><br>
		    			<%= maglietta.getNome() %><br>
		    			&euro;&nbsp;<%= prezzo %> + <%= maglietta.getIVA() %> &percnt; IVA<br>
		    			Colore: <%= maglietta.getColore() %> <br>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td class="bottoni" colspan="2">
		    			<form action="DescrizioneMaglietta" method="GET">
				          <input type="hidden" name="id" value="<%= maglietta.getID() %>">
				          <button type="submit">Mostra descrizione</button>
				        </form>
				        <form action="StampaMaglietta" method="GET">
				          <input type="hidden" name="id" value="<%= maglietta.getID() %>">
				          <button type="submit">Modifica</button>
				        </form>
				        <form action="DeleteMaglietta" method="POST">
				          <input type="hidden" name="ID" value="<%= maglietta.getID() %>">
				          <input type="hidden" name="tipo" value="<%= maglietta.getTipo()%>">
				          <button type="submit">Elimina</button>
				        </form>
		    		</td>
	    		</tr>
	    	</table>
    	</div>
    <%
      // Parentesi del for e dell'if
      } } else {
    %>
    <p class="niente">Nessun prodotto disponibile</p>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
	<lord-icon
	    src="https://cdn.lordicon.com/imamsnbq.json"
	    trigger="loop"
	    delay="1500"
	    colors="primary:#000000,secondary:#000000"
	    stroke="85"
	    style="width:25%;height:25%">
	</lord-icon>
    <% } %>
 </div>
 <br><br>

  <h1>Inserimento magliette</h1>

  <form action="SaveMaglietta" method="post" enctype="multipart/form-data">
    <fieldset>
      <legend>Compilare i seguenti campi</legend>
      <label>Nome: <input type="text" name="nome" required autocomplete="off"></label> <br>
      <label>Prezzo: <input type="text" inputmode="decimal" name="prezzo" required autocomplete="off"></label> <br>
      <label>IVA: <input type="text" inputmode="numeric" name="IVA" required autocomplete="off"></label> <br>

      <label for="colore">Colore: </label>
      <select name="colore" id="colore">
        <option value="Blu">Blu</option>
        <option value="Rosso">Rosso</option>
        <option value="Giallo">Giallo</option>
        <option value="Verde">Verde</option>
        <option value="Viola">Viola</option>
        <option value="Rosa">Rosa</option>
        <option value="Azzurro">Azzurro</option>
        <option value="Nero">Nero</option>
        <option value="Bianco">Bianco</option>
        <option value="Arancione">Arancione</option>
      </select> <br>

      <label for="tipo">Tipo:</label>
      <select name="tipo" id="tipo">
        <option value="Anime e Manga">Anime e Manga</option>
        <option value="Film e Serie TV">Film e Serie TV</option>
        <option value="Girl Power">GRLPWR: Girl Power</option>
        <option value="Fumetti">Fumetti</option>
      </select> <br>

      <label>Descrizione: <br> <textarea name="descrizione" required autocomplete="off"></textarea></label> <br> <br>
      <label>Grafica: <input type="file" name="grafica" accept="image/*" required></label> <br>
      <input type="submit" value="Carica">
    </fieldset>
  </form>
  <%@ include file="pages/footer.jsp" %>
</body>

</html>