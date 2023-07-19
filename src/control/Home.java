package control;

import control.utente.Login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Home")
public class Home extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer tipoUtente = (Integer) req.getSession().getAttribute("tipoUtente");

        if (tipoUtente != null && tipoUtente.equals(Login.ADMIN))
            req.getRequestDispatcher("catalogoAdmin.jsp").forward(req, resp);
        else
            req.getRequestDispatcher("catalogo.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
