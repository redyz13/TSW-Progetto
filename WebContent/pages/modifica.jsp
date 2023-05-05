<%@ page import="model.maglietta.MagliettaBean" %>
<html>
<head>
    <title>Modifica Maglietta</title>
</head>
<body>
<%@ include file="header.jsp" %>
<style><%@ include file="../css/header.css" %></style>
<h1>Modifica maglietta</h1>

<%  MagliettaBean magliettaBean = (MagliettaBean) request.getAttribute("maglietta"); %>
<form action="UpdateMaglietta" method="post" enctype="multipart/form-data">
    <fieldset>
    <legend>Modifica dei campi</legend>
    <label>Nome: <input type="text" name="nome" value="<%=magliettaBean.getNome()%>" required autocomplete="off"></label> <br>
    <label>Prezzo: <input type="text" name="prezzo" value="<%=magliettaBean.getPrezzo()%>" required autocomplete="off"></label> <br>
    <label>IVA: <input type="text" name="IVA" value="<%=magliettaBean.getPrezzo()%>"  required autocomplete="off"></label> <br>

    <label for="colore">Colore: </label>
    <select name="colore" id="colore">
        <option value="none" selected disabled hidden><%= magliettaBean.getColore() %></option>
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

    <label for="tipo">Tipo:</label>
    <select name="tipo" id="tipo">
        <option value="none" selected disabled hidden><%= magliettaBean.getTipo() %></option>
        <option value="Anime e Manga">Anime e Manga</option>
        <option value="Film e Serie TV">Film e Serie TV</option>
        <option value="Girl Power">GRLPWR: Girl Power</option>
        <option value="Fumetti">Fumetti</option>
    </select> <br>

    <label>Descrizione: <br> <textarea name="descrizione"  required autocomplete="off"><%=magliettaBean.getDescrizione()%></textarea></label> <br> <br>
    <label>Grafica: <input type="file" name="grafica" accept="image/*" required></label> <br>
    <input type="submit" value="Modifica">
    </fieldset>
    </form>

<%@ include file="footer.jsp" %>
<style><%@ include file="../css/footer.css" %></style>
</body>
</html>
