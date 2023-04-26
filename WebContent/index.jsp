<%@ page import="java.util.Collection" %>
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
  <link rel="stylesheet" href="styles/index.css">
  <title>Home</title>
</head>

<body>
  <h1>Magliette</h1>

  <table>
    <tr>
      <th><a href="Catalogo?ordine=nome">Nome</a></th>
      <th><a href="Catalogo?ordine=prezzo">Prezzo</a></th>
      <th><a href="Catalogo?ordine=IVA">IVA</a></th>
      <th><a href="Catalogo?ordine=colore">Colore</a></th>
      <th><a href="Catalogo?ordine=tipo">Tipo</a></th>
      <th><a href="Catalogo?ordine=grafica">Grafica</a></th>
    </tr>
    <%
      if (magliette != null && magliette.size() != 0) {
        for (Object o : magliette) {
          MagliettaBean maglietta = (MagliettaBean) o;
    %>
    <tr>
      <td><%= maglietta.getNome() %></td>
      <td><%= maglietta.getPrezzo() %></td>
      <td><%= maglietta.getIVA() %></td>
      <td><%= maglietta.getColore() %></td>
      <td><%= maglietta.getTipo() %></td>
      <td><%= maglietta.getGrafica() %></td>
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
</body>

</html>