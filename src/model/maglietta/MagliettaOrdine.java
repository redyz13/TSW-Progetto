package model.maglietta;

import model.maglietta.MagliettaBean;

public class MagliettaOrdine {
    private MagliettaBean magliettaBean;
    private int quantita;

    public MagliettaOrdine(MagliettaBean magliettaBean) {
        this.magliettaBean = magliettaBean;
        quantita = 1;
    }

    public MagliettaBean getMagliettaBean() {
        return magliettaBean;
    }

    public void setMagliettaBean(MagliettaBean magliettaBean) {
        this.magliettaBean = magliettaBean;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public void incrementaQuantita() {
        quantita++;
    }

    public void decremenetaQuantita() {
        quantita--;
    }

    public float getPrezzoTotale() {
        return quantita * magliettaBean.getPrezzo();
    }
}
