<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.acquisto.AcquistoBean" %>
<%@ page import="model.ordine.OrdineBean" %>
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
</head>
<body>
<%@ include file="header.jsp" %>
<div class="profilo">
    <div class="utente-header">
        <h3>Bentornato <%= utenteBean.getUsername()%>!</h3>
    </div>
    <div class="indirizzo">
        <div class="indirizzo-header">Indirizzo</div>
        <div class="indirizzo-body">
            <p>Via: <%=utenteBean.getVia() %></p><br>
            <p>Citta:<%=utenteBean.getCitta() %>,</p>
            <p>Cap:<%=utenteBean.getCap() %></p>
        </div>
        <div class="modifica-indirizzo">
            <button class="indirizzo-button" type="submit">Modifica indirizzo</button>
        </div>
    </div>

    <div class="metodo-di-pagamento">
        <div class="pagamento-header">Metodo di Pagamento</div>
        <div class="pagamento-body">
            <label for="numCarta">Numero Carta</label>
            <input type="text" id="numCarta" name="numCarta" value="<%=utenteBean.getNumCarta()%>">
            <label for="dataScadenza">Data Scadenza</label>
            <input type="text" id="dataScadenza" name="dataScadenza" value="<%=utenteBean.getDataScadenza()%>">
        </div>
        <div class="pagamento-button">
            <form action="ModificaPagamento">

            </form>
            <button class="pagamento-button" type="submit">Modifica metodo di pagamento</button>
        </div>

        <div class="ordini">
            <%
                if (ordini != null)
                    for (Map.Entry<?, ?> entry : ordini.entrySet()) {
                        OrdineBean ordineBean = (OrdineBean) entry.getKey();
                        Collection<AcquistoBean> acquisti = (Collection<AcquistoBean>) entry.getValue();
                        System.out.println(acquisti);
            %>
            <table>
            <caption hidden>Ordini</caption>
            <tr hidden>
                <th>Key</th>
            </tr>
            <tr>
                <td><%= ordineBean.getID() %></td>
                <%
                    for (AcquistoBean acquisto: acquisti) {
                %>
                <td><img src="<%= acquisto.getImmagine() %>" alt="<%= acquisto.getIDMaglietta() %>"></td>
            </tr>
            </table>
            <%} }%>
        </div>
    </div>
</div>
</body>
</html>
