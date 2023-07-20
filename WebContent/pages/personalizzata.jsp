<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalizzata.css">
        <title>Personalizza maglietta</title>
	</head>
	<body>
	
		<%@ include file="header.jsp"%>
		<script src="${pageContext.request.contextPath}/js/personalizzata.js"></script>
        <div class="tshirt-div">
            <img id="tshirt-backgroundpicture" src="${pageContext.request.contextPath}/images/system/tshirt-base.png" alt="T-shirt background"/>
            <img id="tshirt-new" src="${pageContext.request.contextPath}/images/system/void.png" alt="Nuova T-Shirt">
        </div>
        
		<button id="rmImage" onclick="rmImage()">Rimuovi Immagine</button>
        <br>
        <label for="tshirt-design">Grafica T-Shirt:</label>
        <select id="tshirt-design" onchange="addImage()">
            <option value="">Seleziona uno dei nostri design ...</option>
            <option value="${pageContext.request.contextPath}/images/system/logo.png">whiTee</option>
        </select>
        <br><br>
        <label for="tshirt-color">Colore T-Shirt</label>
        <select id="tshirt-color" onchange="changeColor()">
            <option value="#BF40BF">Viola</option>
            <option value="#fff">Bianco</option>
            <option value="#000">Nero</option>
            <option value="#f00">Rosso</option>
            <option value="#008000">Verde</option>
            <option value="#ff0">Giallo</option>
        </select>
        <br><br>
        <label for="tshirt-custompicture">Carica la tua grafica:</label>
        <input type="file" id="tshirt-custompicture" accept="image/*" onchange="addNew()">
	</body>
</html>