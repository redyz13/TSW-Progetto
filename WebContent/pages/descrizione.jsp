<%@ page import="model.maglietta.MagliettaBean" %>
<% MagliettaBean magliettaBean = (MagliettaBean) request.getAttribute("magliettaBean"); %>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/descrizione.css">
  <title>Descrizione Prodotto</title>
</head>
<body>
<%@ include file="header.html" %>
<style><%@ include file="../css/header.css" %></style>

<h1><%= magliettaBean.getNome() %></h1>
<img src="<%= magliettaBean.getGrafica() %>" alt="<%= magliettaBean.getNome() %>">
<p><%= magliettaBean.getDescrizione() %></p>

<%@ include file="footer.html" %>
<style><%@ include file="../css/footer.css" %></style>
</body>