<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.acquisto.AcquistoBean" %>
<%@ page import="model.ordine.OrdineBean" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.FormatStyle" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<% UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("utente"); %>

<%
    Map<?, ?> ordini = (Map<?, ?>) request.getAttribute("ordini");
    if (ordini == null)
        response.sendRedirect("../StoricoOrdini");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo utente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profilo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modificaPagamento.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="profilo">
    <div class="utente-header">
        <h3>Bentornato <%= utenteBean.getUsername()%>!</h3>
    </div>
    <div class="indirizzo-e-header">
        <div class="indirizzo">
            <div class="indirizzo-header">Indirizzo</div>
            <div class="indirizzo-body">
                <label for="via-utente">Via: </label>
                <input type="text" name="via-utente" id="via-utente" value="<%=utenteBean.getVia() %>" disabled>
                <label for="citta-utente">Citta: </label>
                <input type="text" name="citta-utente" id="citta-utente" value="<%=utenteBean.getCitta()%>" disabled>
                <label for="cap-utente">Cap: </label>
                <input type="text" name="cap-utente" id="cap-utente" value="<%=utenteBean.getCap()%>()" disabled>
            </div>
            <div class="modifica-indirizzo">
                <button class="indirizzo-button button" id="modifica-indirizzo" type="submit">Modifica indirizzo</button>
            </div>
        </div>

        <div class="metodo-di-pagamento">
            <div class="pagamento-header">Metodo di Pagamento</div>
            <div class="pagamento-body">
                <label for="nomeCarta">Nome Carta</label>
                <input type="text" id="nomeCarta" name="nomeCarta" value="<%=utenteBean.getNomeCarta()%>" disabled><br>
                <label for="cognomeCarta">Cognome Carta</label>
                <input type="text" id="cognomeCarta" name="cognomeCarta" value="<%=utenteBean.getNomeCarta()%>" disabled><br>
                <label for="numCarta">Numero Carta</label>
                <input type="text" id="numCarta" name="numCarta" value="<%=utenteBean.getNumCarta()%>" disabled>
                <label for="dataScadenza">Data Scadenza</label>
                <input type="text" id="dataScadenza" name="dataScadenza" value="<%=utenteBean.getDataScadenza()%>" disabled>
            </div>
            <div class="pagamento-button">
                    <button class="pagamento-button button" type="submit" onclick="openPopUp()">Modifica metodo di pagamento</button>
            </div>
            <div class="modifica-pagamento" id="modifica-pagamento">
                <div class="pagamento-header">
                    <span class="header-title">Modifica pagamento</span> <span><button
                        class="close-button" onclick="closePopUp()">&times;</button></span>
                </div>
                <div class="pagamento-body">
                    <form action="ModificaPagamento" method="POST" id="modifica-pagamento-form">
                        <input type="hidden" name="modificaPagamento" value="profilo">
                        <label for="nomeCartaNuova">Nome</label>
                        <input type="text" id="nomeCartaNuova" name="nomeCartaNuova" required><br>
                        <label for="cognomeCartaNuova">Cognome</label>
                        <input type="text" id="cognomeCartaNuova" name="cognomeCartaNuova" required><br>
                        <label for="numCartaNuova">Numero sulla carta </label>
                        <input type="text" id="numCartaNuova" name="numCartaNuova" required><br>
                        <label for="dataScadNuova">Data di scadenza</label>
                        <input type="date" id="dataScadNuova" name="dataScadNuova" required><br>
                        <label for="CVVNuovo">Codice sicurezza (CVV)</label>
                        <input type="text" id="CVVNuovo" name="CVVNuovo" required><br>
                        <button type="submit">Aggiungi carta</button>
                        <div class="non-valido"></div>
                    </form>
                </div>
            </div>
            <div id="overlay"></div>
        </div>
    </div>
    <div class="ordini">
        <%
            if (ordini != null)
                for (Map.Entry<?, ?> entry : ordini.entrySet()) {
                    OrdineBean ordineBean = (OrdineBean) entry.getKey();
                    Collection<AcquistoBean> acquisti = (Collection<AcquistoBean>) entry.getValue();
        %>
        <table>
            <caption hidden>Ordini</caption>
            <tr class="header-ordini">
                <th>Ordine numero</th>
                <th>Prezzo Totale</th>
                <th>Data Ordine</th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <td><%= ordineBean.getID() %></td>
                <td>€ <%= ordineBean.getPrezzoTotale() %></td>
                <td><%=ordineBean.getDataOrdine().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))%></td>
                <td>
                    <button type="button" id="<%=ordineBean.getID()%>" class="button" onclick="slide(<%=ordineBean.getID()%>, 'tr<%=ordineBean.getID()%>')">Mostra dettagli</button>
                </td>
                <td>
                    <form method="POST" action="StampaFattura">
                        <button type="submit" class="button">Stampa fattura</button>
                    </form>
                </td>
            </tr>

            <tr class="acquisti" id="tr<%=ordineBean.getID()%>">
                <td>
                    <table>
                        <%
                        for (AcquistoBean acquisto: acquisti) {
                        %>
                        <tr>
                            <th>Grafica</th>
                            <th>Quantità</th>
                            <th>Taglia</th>
                            <th>Prezzo</th>
                            <th>IVA</th>
                        </tr>
                        <tr>
                            <td>
                                <img src="<%= acquisto.getImmagine() %>" alt="<%= acquisto.getIDMaglietta() %>">
                            </td>
                            <td>
                                <p><%=acquisto.getQuantita()%></p>
                            </td>
                            <td>
                                <p><%=acquisto.getTaglia()%></p>
                            </td>
                            <td>
                                <p><%=acquisto.getPrezzoAq()%></p>
                            </td>
                            <td>
                                <p><%=acquisto.getIvaAq()%></p>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                </td>
            </tr>
        </table>
        <% }%>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/metodoPagamento.js"></script>
<script>
    let toggle = false;
</script>
<script>
    function slide(ordine, acquisto) {
        toggle ^= true;

        let acq = document.getElementById(acquisto);
        let button = document.getElementById(ordine);

        if (toggle) {
            acq.classList.remove("acquisti");
            button.innerText = "Mostra meno";
        }
        else {
            acq.classList.add("acquisti");
            button.innerText = "Mostra dettagli";
        }
    }
</script>
</body>
</html>
