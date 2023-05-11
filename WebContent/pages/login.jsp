<%@ page import="model.utente.UtenteDAO" %>
<%@ page import="model.utente.UtenteBean" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: carota
  Date: 11/05/2023
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="Login" method="post">
    <fieldset>
        <legend>Login</legend>
        <label for="username">Login</label>
        <input id="username" type="text" name="username" placeholder="Username">
        <br>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Password">
        <br>
        <button type="submit">Accedi</button>
    </fieldset>
</form>
</body>
</html>
