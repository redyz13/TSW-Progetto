
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
<br>
<form action="${pageContext.request.contextPath}/Registrazione" method="post">
    <fieldset>
        <legend>Registrazione</legend>
        <label for="usernameReg"></label><input  type="text" name="usernameReg" id="usernameReg" placeholder="Username" required>
        <br><label for="passwordReg"></label><input type="password" name="passwordReg" id="passwordReg" placeholder="Password" required>
        <br><label for="nomeReg"></label><input type="text" name="nomeReg" id="nomeReg" placeholder="Nome" required>
        <br><label for="cognomeReg"></label><input type="text" name="cognomeReg" id="cognomeReg" placeholder="Cognome" required>
        <br><label for="emailReg"></label><input type="text" name="emailReg" id="emailReg" placeholder="Email" required>
        <br><label for="dataNascitaReg"></label><input type="date" name="dataNascitaReg" id="dataNascitaReg" required>
        <input type="hidden" name="tipo" value="user">
        <br><button type="submit">Registrati</button>
    </fieldset>
</form>
<% if (session.getAttribute("utentePresente") != null  && session.getAttribute("utentePresente").equals(false)) { %>
<p>Utente registrato correttamente!</p>
<% } else if (session.getAttribute("utentePresente")!= null && session.getAttribute("utentePresente").equals(true)) { %>
<p>Username o email gi&#224 in uso</p>
<% }
    session.removeAttribute("utentePresente");
%>

<%@ include file="footer.jsp" %>
<style><%@ include file="../css/footer.css" %></style>
</body>
</html>
