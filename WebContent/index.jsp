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
  <%@ include file="pages/header.html" %>
  <h1><a href="Catalogo">Magliette</a></h1>

    <table id="prodotti">
      <tr id="drop">
          <td colspan="6" >
              <div class="dropdown">
                  <button class="dropbtn">Ordina per &dtrif;</button>
                  <div class="dropdown-content">
                      <a href="Catalogo?ordine=nome">Nome</a>
                      <a href="Catalogo?ordine=prezzo">Prezzo</a>
                      <a href="Catalogo?ordine=IVA">IVA</a>
                      <a href="Catalogo?ordine=colore">Colore</a>
                      <a href="Catalogo?ordine=tipo">Tipo</a>
                      <a href="Catalogo?ordine=grafica">Grafica</a>
                  </div>
              </div>
              <br>
              <br>
          </td>
      </tr>
      <tr id="element">
        <th>Nome</th>
        <th>Prezzo</th>
        <th>IVA</th>
        <th>Colore</th>
        <th>Tipo</th>
        <th>Grafica</th>
      </tr>
    <%
      if (magliette != null && magliette.size() != 0) {
    	DecimalFormat df = new DecimalFormat("#.##");
    	df.setRoundingMode(RoundingMode.FLOOR);
        for (Object o : magliette) {
          MagliettaBean maglietta = (MagliettaBean) o;
          String prezzo = df.format(maglietta.getPrezzo());
          if(prezzo.matches("[0-9]+")){
        	  prezzo=prezzo+".00";
          }
          String tipo="";
          switch(maglietta.getTipo()){
          case "ANIMEMANGA": 
        	  tipo=tipo+"Anime e Manga";
          	  break;
          case "FILMSERIETV":
        	  tipo=tipo+"Film e Serie TV";
        	  break;
          case "GRLPWR":
        	  tipo=tipo+"Girl Power";
        	  break;
          case "FUMETTI":
        	  tipo=tipo+"Fumetti";
        	  break;
          }
    %>
    <tr id="element">
      <td><%= maglietta.getNome() %></td>
      <td>&euro; &nbsp;<%= prezzo %></td>
      <td><%= maglietta.getIVA() %></td>
      <td><%= maglietta.getColore() %></td>
      <td><%= tipo %></td>
      <td><img src="<%= maglietta.getGrafica() %>" alt="<%= maglietta.getNome() %>"></td>
    </tr>
    <%
      // Parentesi del for e dell'if
      } } else {
    %>
    <tr>
      <td colspan="6">Nessun prodotto disponibile</td>
    </tr>
    <% } %>
  </table>
  
  <h1>Inserimento magliette</h1>

  <form action="SaveMaglietta" method="post" enctype="multipart/form-data">
    <fieldset>
      <legend>Compilare i seguenti campi</legend>
      <label>Nome: <input type="text" name="nome" required autocomplete="off"></label> <br>
      <label>Prezzo: <input type="text" name="prezzo" required autocomplete="off"></label> <br>
      <label>IVA: <input type="text" name="IVA" required autocomplete="off"></label> <br>

      <label for="colore">Colore: </label>
      <select name="colore" id="colore">
        <option value="BLU">Blu</option>
        <option value="ROSSO">Rosso</option>
        <option value="GIALLO">Giallo</option>
        <option value="VERDE">Verde</option>
        <option value="VIOLA">Viola</option>
        <option value="ROSA">Rosa</option>
        <option value="AZZURRO">Azzurro</option>
        <option value="NERO">Nero</option>
        <option value="BIANCO">Bianco</option>
      </select> <br>

      <label for="tipo">Tipo:</label>
      <select name="tipo" id="tipo">
        <option value="ANIMEMANGA">Anime e Manga</option>
        <option value="FILMSERIETV">Film e Serie TV</option>
        <option value="GRLPWR">GRLPWR: Girl Power</option>
        <option value="FUMETTI">Fumetti</option>
      </select> <br>

      <label>Grafica: <input type="file" name="grafica" accept="image/*" required></label> <br>
      <input type="submit" value="Carica">
    </fieldset> 
  </form>
  <%@ include file="pages/footer.html" %>
</body>

</html>