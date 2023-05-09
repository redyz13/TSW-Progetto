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
  <style><%@ include file="css/header.css" %></style>
  <h1> <a href="Catalogo">Magliette</a> </h1>

    <table id="prodotti">
      <caption hidden>Catalogo</caption>
      <tr id="drop">
        <td colspan="6" >
          <div class="dropdown">
            <button class="dropbtn">Ordina per &dtrif;</button>
            <div class="dropdown-content">
              <a href="Catalogo?ordine=nome">Nome</a>
              <a href="Catalogo?ordine=prezzo">Prezzo</a>
              <a href="Catalogo?ordine=colore">Colore</a>
              <a href="Catalogo?ordine=tipo">Tipo</a>
            </div>
          </div>
          <br>
          <br>
        </td>
      </tr>
      <tr id="element">
        <th scope="col">Nome</th>
        <th scope="col">Prezzo</th>
        <th scope="col">IVA</th>
        <th scope="col">Colore</th>
        <th scope="col">Tipo</th>
        <th scope="col">Grafica</th>
      </tr>
    <%
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
    <tr id="element">
      <td><%= maglietta.getNome() %> </td>
      <td>&euro;&nbsp;<%= prezzo %> </td>
      <td><%= maglietta.getIVA() %> </td>
      <td><%= maglietta.getColore() %> </td>
      <td><%= maglietta.getTipo() %> </td>
      <td><img src="<%= maglietta.getGrafica() %>" alt="<%= maglietta.getNome() %>"></td>
      <td>
        <form action="DescrizioneMaglietta" method="GET">
          <input type="hidden" name="id" value="<%= maglietta.getID() %>">
          <button type="submit">Mostra descrizione</button>
        </form>
        <form action="AggiungiMaglietta" method="POST">
          <input type="hidden" name="ID" value="<%= maglietta.getID() %>">
          <button type="submit">Aggiungi al carrello</button>
        </form>
      </td>
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
  <%@ include file="pages/footer.jsp" %>
  <style><%@ include file="css/footer.css" %></style>
</body>

</html>
