package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final int ADMIN = 0;
    private static final int REGISTRATO = 1;
    private static final int NONREGISTRATO = 2;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            String redirectedPage = "";
            int tipoUtente = checkUser(username, password);

            switch (tipoUtente) {
                case ADMIN:
                    req.getSession().setAttribute("utente", "admin");
                    redirectedPage = "indexAdmin.jsp";
                    break;
                case REGISTRATO:
                    req.getSession().setAttribute("utente", "registrato");
                    redirectedPage = "index.jsp";
                    break;
                case NONREGISTRATO:
                    req.getSession().setAttribute("utente", "non registrato");
                    redirectedPage = "login.jsp";
            }

            RequestDispatcher dispatcher = req.getRequestDispatcher(redirectedPage);
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private int checkUser(String username, String password) throws SQLException {
        UtenteDAO utenteDAO = new UtenteDAO();
        UtenteBean utenteBean = utenteDAO.doRetrieveByKey(username);

        if (utenteBean == null || utenteBean.getPwd().equals(password))
            return NONREGISTRATO;
        else {
            if (utenteBean.getTipo().equals("admin"))
                return ADMIN;
            else
                return REGISTRATO;
        }
    }
}
