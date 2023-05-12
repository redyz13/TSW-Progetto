<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
