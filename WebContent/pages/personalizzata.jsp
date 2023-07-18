<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalizzata.css">
	</head>
	<body>
	
		<%@ include file="header.jsp"%>
		<script src="${pageContext.request.contextPath}/js/personalizzata.js"></script>
		<!-- Create the container of the tool -->
        <div class="tshirt-div">
            <img id="tshirt-backgroundpicture" src="${pageContext.request.contextPath}/images/system/tshirt-base.png"/>
            <img id="tshirt-new" src="${pageContext.request.contextPath}/images/system/void.png">
        </div>
        
		<button id="rmImage" onclick="rmImage()">Rimuovi Immagine</button>
        <br>
        <label for="tshirt-design">T-Shirt Design:</label>
        <select id="tshirt-design" onchange="addImage()">
            <option value="">Select one of our designs ...</option>
            <option value="${pageContext.request.contextPath}/images/system/logo.png">whiTee</option>
        </select>
        <!-- The Select that allows the user to change the color of the T-Shirt -->
        <br><br>
        <label for="tshirt-color">T-Shirt Color:</label>
        <select id="tshirt-color" onchange="changeColor()">
            <!-- colors -->
            <option value="#fff">White</option>
            <option value="#000">Black</option>
            <option value="#f00">Red</option>
            <option value="#008000">Green</option>
            <option value="#ff0">Yellow</option>
        </select>
        <br><br>
        <label for="tshirt-custompicture">Upload your own design:</label>
        <input type="file" id="tshirt-custompicture" accept="image/*" onchange="addNew()" />
	</body>
</html>