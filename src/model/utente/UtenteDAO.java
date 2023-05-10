package model.utente;

import model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class UtenteDAO implements DAOInterface<UtenteBean> {
    private final static String TABLE_NAME = "Maglietta";
    private static final DataSource ds;

    // Connessione database
    static {
        try {
            Context init = new InitialContext();
            Context env = (Context) init.lookup("java:comp/env");

            ds = (DataSource) env.lookup("jdbc/whiTee");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    public UtenteBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<UtenteBean> doRetriveAll(String order) throws SQLException {
        return null;
    }

    @Override
    public void doSave(UtenteBean product) throws SQLException {

    }

    @Override
    public void doUpdate(UtenteBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(int code) throws SQLException {
        return false;
    }
}
