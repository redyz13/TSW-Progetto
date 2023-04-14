<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="UTF-8" />
    <title>Result</title>
  </head>
  <body>
    <p>You wrote:</p>
    <% out.print(request.getAttribute("wroteText")); %>
  </body>
</html>
