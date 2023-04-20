package model.maglietta;

public class MagliettaBean {
    private int ID, IVA;
    private String nome, colore, tipo, url;
    private float prezzo;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIVA() {
        return IVA;
    }

    public void setIVA(int IVA) {
        this.IVA = IVA;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getColore() {
        return colore;
    }

    public void setColore(String colore) {
        this.colore = colore;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(float prezzo) {
        this.prezzo = prezzo;
    }

    @Override
    public String toString() {
        return "MagliettaBean{" +
                "ID=" + ID +
                ", IVA=" + IVA +
                ", nome='" + nome + '\'' +
                ", colore='" + colore + '\'' +
                ", tipo='" + tipo + '\'' +
                ", url='" + url + '\'' +
                ", prezzo=" + prezzo +
                '}';
    }
}
