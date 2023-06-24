<%@ page import="model.CarrelloModel" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="model.maglietta.MagliettaOrdine" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CarrelloModel carrello = (CarrelloModel) session.getAttribute("carrello");
    Collection<?> oggettiCarrello = carrello.getCarrello();
%>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carrello.css">
    <%-- TODO cambiare il css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
</head>
<body>
<h1>Riepilogo Ordine</h1>
<div class="table">
  <table>
      <caption hidden>Carrello</caption>
      <tr id="element">
          <th>Nome</th>
          <th>Prezzo</th>
          <th>IVA</th>
          <th>Colore</th>
          <th>Tipo</th>
          <th>Grafica</th>
          <th>Quantita</th>
      </tr>
      <%
              DecimalFormat df = new DecimalFormat("#.##");
              df.setRoundingMode(RoundingMode.FLOOR);

              for (Object o : oggettiCarrello) {
                  MagliettaOrdine magliettaOrdine = (MagliettaOrdine) o;
                  String prezzo = df.format(magliettaOrdine.getMagliettaBean().getPrezzo());

                  if (prezzo.matches("[0-9]+"))
                      prezzo += ".00";
      %>
      <tr id="element">
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getNome() %> </td>
          <td colspan="2">&euro;&nbsp;<%= prezzo %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getIVA() %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getColore() %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getTipo() %> </td>
          <td colspan="2"><img src="../<%= magliettaOrdine.getMagliettaBean().getGrafica() %>" alt="<%= magliettaOrdine.getMagliettaBean().getNome() %>"></td>
          <td colspan="2"><%= request.getAttribute("quantita") %></td>
      </tr>
      <% } %>
  </table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>