<%@ page import="model.CarrelloModel" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="model.maglietta.MagliettaOrdine" %>
<%@ page import="model.utente.UtenteBean" %>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modificaPagamento.css">
</head>
<body>
<%@ include file="footer.jsp" %>
<%float prezzoTot = 0;%>
<h1>Riepilogo Ordine</h1>
<div class="riepilogo-ordine">
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
          <th>Prezzo totale</th>
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
      <tr class="prodotti-carrello" id="prodotti-carrello">
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getNome() %> </td>
          <td colspan="2">&euro;&nbsp;<%= prezzo %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getIVA() %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getColore() %> </td>
          <td colspan="2"><%= magliettaOrdine.getMagliettaBean().getTipo() %> </td>
          <td colspan="2"><img src="../<%= magliettaOrdine.getMagliettaBean().getGrafica() %>" alt="<%= magliettaOrdine.getMagliettaBean().getNome() %>"></td>
          <td colspan="2"><%= magliettaOrdine.getQuantita() %></td>
          <td colspan="2"><%= magliettaOrdine.getPrezzoTotale() %></td>
          <% prezzoTot += magliettaOrdine.getPrezzoTotale(); %>
      </tr>
      <% } %>
  </table>
    <p>Prezzo totale: <%=prezzoTot%><p>
</div>
<div class="metodo-di-pagamento">
    <h3>Metodo di pagamento:</h3>
    <% UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("utente"); %>
    <label for="numCarta">Numero Carta</label>
    <input type="text" id="numCarta" name="numCarta" value="<%= utenteBean.getNumCarta()%>" disabled>
    <label for="dataScadenza">Data Scadenza</label>
    <input type="date" id="dataScadenza" name="dataScadenza" value="<%= utenteBean.getDataScadenza()%>" disabled>
    <br>
    <button type="submit" onclick="openPopUp()">Modifica metodo di pagamento</button>
</div>
<div class="modifica-pagamento" id="modifica-pagamento">
    <div class="pagamento-header">
        <span class="header-title">Modifica Pagamento</span>
        <span><button class="close-button" onclick="closePopUp()">&times;</button></span>
    </div>
    <div class="pagamento-body">
        <form action="/ModificaPagamento" method="POST">
            <label for="nomeCartaNuova">Nome sulla carta</label>
            <input type="text" id="nomeCartaNuova" name="nomeCarta"><br>
            <label for="numCartaNuova">Numero sulla carta </label>
            <input type="text" id="numCartaNuova" name="numCarta"><br>
            <label for="dataScadNuova">Data di scadenza</label>
            <input type="date" id="dataScadNuova" name="dataScadNuova"><br>
            <label for="CVCNuovo">Codice sicurezza (CVV)</label>
            <input type="text" id="CVCNuovo" name="CVCNuovo"><br>
            <button type="submit">Aggiungi carta</button>
        </form>
    </div>
</div>
<div id="overlay"></div>
<%@ include file="footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/metodoPagamento.js"></script>
</body>
</html>