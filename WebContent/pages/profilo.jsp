<%@ page import="model.utente.UtenteBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profilo utente</title>
</head>
<%
    UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("utente");
%>
<body>
    <div class="utente-bar">
        <p><%= utenteBean.getUsername()%>!</p>
    </div>
    <div class="indirizzo">
        <div class="indirizzo-header">Indirizzo</div>
        <div class="indirizzo-body">
            <p>Via: <%=utenteBean.getVia() %></p><br>
            <p><%=utenteBean.getCitta() %>,</p>
            <p><%=utenteBean.getCap() %></p>
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
    </div>
</body>
</html>
