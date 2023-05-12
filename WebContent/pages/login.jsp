<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <%-- TODO cambiare il css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<%@ include file="header.jsp" %>
<style><%@ include file="../css/header.css" %></style>
<form action="${pageContext.request.contextPath}/Login" method="post">
    <fieldset>
        <legend>Login</legend>
        <label for="username"></label><input id="username" type="text" name="username" placeholder="Username" required>
        <br><label for="password"></label><input type="password" name="password" id="password" placeholder="Password" required>
        <br><button type="submit">Accedi</button>
    </fieldset>
</form>

<%@ include file="footer.jsp" %>
<style><%@ include file="../css/footer.css" %></style>
</body>
</html>
