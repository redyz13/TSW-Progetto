package model.misura;

public class MisuraBean {
    int IDMaglietta, TG, quantita;

    public int getIDMaglietta() {
        return IDMaglietta;
    }

    public void setIDMaglietta(int IDMaglietta) {
        this.IDMaglietta = IDMaglietta;
    }

    public int getTG() {
        return TG;
    }

    public void setTG(int TG) {
        this.TG = TG;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    @Override
    public String toString() {
        return "MisuraBean{" +
                "IDMaglietta=" + IDMaglietta +
                ", TG=" + TG +
                ", quantita=" + quantita +
                '}';
    }
}
