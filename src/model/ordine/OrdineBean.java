package model.ordine;

import java.time.LocalDate;

public class OrdineBean {
    String ID, username, cap, via, citta;
    LocalDate dataConsegna, dataOrdine;
    float prezzoTotale;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public LocalDate getDataConsegna() {
        return dataConsegna;
    }

    public void setDataConsegna(LocalDate dataConsegna) {
        this.dataConsegna = dataConsegna;
    }

    public LocalDate getDataOrdine() {
        return dataOrdine;
    }

    public void setDataOrdine(LocalDate dataOrdine) {
        this.dataOrdine = dataOrdine;
    }

    public float getPrezzoTotale() {
        return prezzoTotale;
    }

    public void setPrezzoTotale(float prezzoTotale) {
        this.prezzoTotale = prezzoTotale;
    }

    @Override
    public String toString() {
        return "OrdineBean{" +
                "username='" + username + '\'' +
                ", cap='" + cap + '\'' +
                ", via='" + via + '\'' +
                ", citta='" + citta + '\'' +
                ", dataConsegna=" + dataConsegna +
                ", dataOrdine=" + dataOrdine +
                ", prezzoTotale=" + prezzoTotale +
                '}';
    }
}
