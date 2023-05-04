package control.maglietta;

import model.Carrello;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AggiungiMaglietta")
public class AggiungiMaglietta extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Carrello carrello;

        synchronized (session) {
            carrello = (Carrello) session.getAttribute("carrello");
            if (carrello == null) {
                carrello = new Carrello();
                session.setAttribute("carello", carrello);
            }
        }

        int ID = Integer.parseInt(req.getParameter("ID"));
        String quantita = req.getParameter("quantita");

        if (quantita == null) {
            carrello.aggiungi(ID);
        }
        else {
            // TODO fare in modo che sia possibile inserire solo numeri nella request
            carrello.setQuantita(ID, Integer.parseInt(quantita));
        }

        RequestDispatcher view = req.getRequestDispatcher("/pages/carrello.jsp");
        view.forward(req, resp);
    }
}
