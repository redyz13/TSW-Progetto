package model.utente;

import java.util.GregorianCalendar;

public class UtenteBean {
    private String username, pwd, nome, cognome, email, numCarta, cap, via, citta, tipo;
    private GregorianCalendar dataNascita, dataScadenza;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumCarta() {
        return numCarta;
    }

    public void setNumCarta(String numCarta) {
        this.numCarta = numCarta;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public GregorianCalendar getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(GregorianCalendar dataNascita) {
        this.dataNascita = dataNascita;
    }

    public GregorianCalendar getDataScadenza() {
        return dataScadenza;
    }

    public void setDataScadenza(GregorianCalendar dataScadenza) {
        this.dataScadenza = dataScadenza;
    }

    private String formatDate (GregorianCalendar date) {
        return date.get(GregorianCalendar.DAY_OF_WEEK) + "/" + date.get(GregorianCalendar.MONTH) + "/" + date.get(GregorianCalendar.YEAR);
    }

    @Override
    public String toString() {
        return "UtenteBean{" +
                "username='" + username + '\'' +
                ", pwd='" + pwd + '\'' +
                ", nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", email='" + email + '\'' +
                ", numCarta='" + numCarta + '\'' +
                ", cap='" + cap + '\'' +
                ", via='" + via + '\'' +
                ", citta='" + citta + '\'' +
                ", tipo='" + tipo + '\'' +
                ", dataNascita=" + formatDate(dataNascita) +
                ", dataScadenza=" + formatDate(dataScadenza) +
                '}';
    }
}