<%@ page import="model.maglietta.MagliettaOrdine" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.CarrelloModel" %>

<%
  CarrelloModel carrello;
  synchronized (session) {
    carrello = (CarrelloModel) session.getAttribute("carrello");
    if (carrello == null) {
      carrello = new CarrelloModel();
      session.setAttribute("carrello", carrello);
    }
  }

  Collection<?> oggettiCarrello = carrello.getCarrello();
%>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carrello.css">
  <%-- TODO cambiare il css --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
  <title>Carrello</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Carrello</h1>
<table id="prodotti">
  <caption hidden>Carrello</caption>
  <tr id="element">
    <th>Nome</th>
    <th>Prezzo</th>
    <th>IVA</th>
    <th>Colore</th>
    <th>Tipo</th>
    <th>Grafica</th>
    <th>Quantit&#224</th>
  </tr>
  <%
    if (oggettiCarrello != null && oggettiCarrello.size() != 0) {
      DecimalFormat df = new DecimalFormat("#.##");
      df.setRoundingMode(RoundingMode.FLOOR);

      for (Object o : oggettiCarrello) {
        MagliettaOrdine magliettaOrdine = (MagliettaOrdine) o;
        String prezzo = df.format(magliettaOrdine.getMagliettaBean().getPrezzo());

        if (prezzo.matches("[0-9]+"))
          prezzo += ".00";
  %>
  <tr id="element">
    <td><%= magliettaOrdine.getMagliettaBean().getNome() %> </td>
    <td>&euro;&nbsp;<%= prezzo %> </td>
    <td><%= magliettaOrdine.getMagliettaBean().getIVA() %> </td>
    <td><%= magliettaOrdine.getMagliettaBean().getColore() %> </td>
    <td><%= magliettaOrdine.getMagliettaBean().getTipo() %> </td>
    <td><img src="../<%= magliettaOrdine.getMagliettaBean().getGrafica() %>" alt="<%= magliettaOrdine.getMagliettaBean().getNome() %>"></td>
    <td>
      <form action="${pageContext.request.contextPath}/AggiungiMaglietta" method="POST">
        <label>
        <%-- TODO fare in modo che sia possibile inserire solo numeri nella request --%>
        <input type="number" name="quantita" min="0" max="100" value="<%= magliettaOrdine.getQuantita() %>">
        <input type="hidden" name="ID" value="<%= magliettaOrdine.getMagliettaBean().getID() %>">
        <br> <button type="submit">Aggiorna</button>
        </label>
      </form>
    </td>
    <td>
      <form action="${pageContext.request.contextPath}/RimuoviMaglietta" method="POST">
        <input type="hidden" name="ID" value="<%= magliettaOrdine.getMagliettaBean().getID() %>">
        <button type="submit">Elimina</button>
      </form>
    </td>
  </tr>
  <%
      // Parentesi del for e dell'if
    } } else {
  %>
  <tr>
    <td colspan="7">Nessun prodotto nel carello</td>
  </tr>
  <% } %>
</table>

<%@ include file="footer.jsp" %>
</body>
