<%@ page import="model.maglietta.MagliettaBean" %>

<% MagliettaBean magliettaBean = (MagliettaBean) request.getAttribute("maglietta"); %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica Maglietta</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modifica.css">
    <%-- TODO cambiare il css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script src="${pageContext.request.contextPath}/js/selezione.js"></script>
</head>
<body onload="setRadio()">
<%@ include file="header.jsp" %>
<style> <%@ include file="../css/header.css" %> </style>
<h1>Modifica maglietta</h1>
<form id="update" action="UpdateMaglietta" method="POST" enctype="multipart/form-data"></form>
<fieldset>
    <legend>Modifica dei campi</legend>
    <label>Nome: <input form="update" type="text" name="nome" value="<%=magliettaBean.getNome()%>" required
                        autocomplete="off"></label> <br>
    <label>Prezzo: <input form="update" type="text" name="prezzo" value="<%=magliettaBean.getPrezzo()%>" required
                          autocomplete="off"></label> <br>
    <label>IVA: <input form="update" type="text" name="IVA" value="<%=magliettaBean.getPrezzo()%>" required
                       autocomplete="off"></label> <br>

    <input form="update" type="hidden" name="coloreVecchio" value="<%= magliettaBean.getColore() %>">
    <label for="colore">Colore: </label>
    <select form="update" name="colore" id="colore">
        <option value="" selected disabled hidden><%= magliettaBean.getColore() %></option>
        <option value="Blu">Blu</option>
        <option value="Rosso">Rosso</option>
        <option value="Giallo">Giallo</option>
        <option value="Verde">Verde</option>
        <option value="Viola">Viola</option>
        <option value="Rosa">Rosa</option>
        <option value="Azzurro">Azzurro</option>
        <option value="Nero">Nero</option>
        <option value="Bianco">Bianco</option>
    </select> <br>

    <input form="update" type="hidden" name="tipoVecchio" value="<%= magliettaBean.getTipo() %>">
    <label for="tipo">Tipo:</label>
    <select form="update" name="tipo" id="tipo">
        <option value="" selected disabled hidden><%= magliettaBean.getTipo() %></option>
        <option value="Anime e Manga">Anime e Manga</option>
        <option value="Film e Serie TV">Film e Serie TV</option>
        <option value="Girl Power">GRLPWR: Girl Power</option>
        <option value="Fumetti">Fumetti</option>
    </select> <br>

    <label>Descrizione: <br> <textarea form="update" name="descrizione" required
                                       autocomplete="off"><%=magliettaBean.getDescrizione()%></textarea></label>
    <p>Aggiornare la grafica?</p>
    <label>S&igrave<input type="radio" name="selezione" value="si" onclick="selezione()"></label>
    <label>No<input type="radio" id="radioNo" name="selezione" value="no" checked onclick="selezione()"></label>
    <br id="newLine" hidden>
    <label id="labelGrafica" hidden>Grafica: <input form="update" id="fileInput" type="file" hidden name="grafica" accept="image/*"></label> <br>
    <input form="update" type="hidden" name="path" value="<%= magliettaBean.getGrafica() %>">
    <input form="update" type="hidden" name="id" value="<%= magliettaBean.getID() %>">
    <input form="update" type="submit" value="Modifica">
</fieldset>

<%@ include file="footer.jsp" %>
<style> <%@ include file="../css/footer.css" %> </style>
</body>
</html>
