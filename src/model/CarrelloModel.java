package model;

import model.maglietta.MagliettaBean;
import model.maglietta.MagliettaDAO;

import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloModel {
    private ArrayList<MagliettaOrdine> carrello;

    public CarrelloModel() {
        carrello = new ArrayList<>();
    }

    public ArrayList<MagliettaOrdine> getCarrello() {
        return carrello;
    }

    public void setCarrello(ArrayList<MagliettaOrdine> carrello) {
        this.carrello = carrello;
    }

    public synchronized void aggiungi(int ID) {
        for (MagliettaOrdine m : carrello) {
            if (m.getMagliettaBean().getID() == ID) {
                m.incrementaQuantita();
                return;
            }
        }

        MagliettaDAO magliettaDAO = new MagliettaDAO();

        try {
            MagliettaBean magliettaBean = magliettaDAO.doRetrieveByKey(ID);
            carrello.add(new MagliettaOrdine(magliettaBean));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public synchronized void setQuantita(int ID, int quantita) {
        for (MagliettaOrdine m : carrello) {
            if (m.getMagliettaBean().getID() == ID) {
                if (m.getQuantita() <= 0 || quantita == 0)
                    carrello.remove(m);
                else
                    m.setQuantita(quantita);
                return;
            }
        }
    }

    public synchronized void rimuovi(int ID) {
        carrello.removeIf(m -> m.getMagliettaBean().getID() == ID);
    }
}
