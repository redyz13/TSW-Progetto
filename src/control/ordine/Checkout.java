package control.ordine;
import model.CarrelloModel;
import model.acquisto.AcquistoBean;
import model.acquisto.AcquistoDAO;
import model.ordine.OrdineBean;
import model.ordine.OrdineDAO;
import model.utente.UtenteBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarrelloModel carrelloModel = (CarrelloModel) req.getSession().getAttribute("carrello");
        float prezzoTot = Float.parseFloat(req.getParameter("prezzo-totale"));
        LocalDate dataConsegna = LocalDate.parse(req.getParameter("data-consegna"));
        UtenteBean utenteBean = (UtenteBean) req.getSession().getAttribute("utente");

        OrdineBean ordineBean = new OrdineBean();
        ordineBean.setUsername(utenteBean.getUsername());
        ordineBean.setPrezzoTotale(prezzoTot);
        ordineBean.setDataConsegna(dataConsegna);
        ordineBean.setDataOrdine(LocalDate.now());
        ordineBean.setCap(req.getParameter("cap-spedizione"));
        ordineBean.setVia(req.getParameter("via-spedizione"));
        ordineBean.setCitta(req.getParameter("citta-spedizione"));
        OrdineDAO ordineDAO = new OrdineDAO();
        try {
            ordineDAO.doSave(ordineBean);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        carrelloModel.getCarrello().forEach(p -> {
            try {
                AcquistoBean acquistoBean = new AcquistoBean();
                acquistoBean.setIDOrdine(new OrdineDAO().getMaxID());
                acquistoBean.setIDMaglietta(p.getMagliettaBean().getID());
                acquistoBean.setQuantita(p.getQuantita());
                acquistoBean.setImmagine(p.getMagliettaBean().getGrafica());
                acquistoBean.setPrezzoAq(p.getMagliettaBean().getPrezzo());
                acquistoBean.setIvaAq(p.getMagliettaBean().getIVA());

                AcquistoDAO acquistoDAO = new AcquistoDAO();
                acquistoDAO.doSave(acquistoBean);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        });
    }
}
