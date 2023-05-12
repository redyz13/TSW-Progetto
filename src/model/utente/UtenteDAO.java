package model.utente;

import model.DAOInterface;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import java.sql.Date;

public class UtenteDAO implements DAOInterface<UtenteBean, String> {
    private static final String TABLE_NAME = "Utente";
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
    public UtenteBean doRetrieveByKey(String code) throws SQLException {
        UtenteBean utenteBean = new UtenteBean();

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE username = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, code);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst())
                return null;

            resultSet.next();

            setUtente(resultSet,utenteBean);
        }

        return utenteBean;
    }

    @SuppressWarnings("all")
    @Override
    public Collection<UtenteBean> doRetriveAll(String order) throws SQLException {
      return null;
    }

    @Override
    public synchronized void doSave(UtenteBean utente) throws SQLException {
        String query = "INSERT INTO " + TABLE_NAME + " (username, pwd, nome, cognome, email, dataNascita, numCarta, dataScadenza, cap, via, citta, tipo) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            setUtenteStatement(utente, preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @SuppressWarnings("all")
    @Override
    public void doUpdate(UtenteBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(String code) throws SQLException {
        int result;

        String query = "DELETE FROM " + TABLE_NAME + " WHERE username = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, code);

            result = preparedStatement.executeUpdate();
        }

        return result != 0;
    }

    private void setUtente(ResultSet resultSet, UtenteBean utenteBean) throws SQLException {
        utenteBean.setUsername(resultSet.getString("username"));
        utenteBean.setPwd(resultSet.getString("pwd"));
        utenteBean.setNome(resultSet.getString("nome"));
        utenteBean.setCognome(resultSet.getString("cognome"));
        utenteBean.setEmail(resultSet.getString("email"));
        utenteBean.setNumCarta(resultSet.getString("numCarta"));
        utenteBean.setCap(resultSet.getString("cap"));
        utenteBean.setVia(resultSet.getString("via"));
        utenteBean.setCitta(resultSet.getString("citta"));
        utenteBean.setTipo(resultSet.getString("tipo"));
        utenteBean.setDataNascita((resultSet.getDate("dataNascita").toLocalDate()));
        utenteBean.setDataScadenza((resultSet.getDate("dataScadenza").toLocalDate()));
    }

    private void setUtenteStatement(UtenteBean utenteBean, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, utenteBean.getUsername());
        preparedStatement.setString(2, utenteBean.getPwd());
        preparedStatement.setString(3, utenteBean.getNome());
        preparedStatement.setString(4, utenteBean.getCognome());
        preparedStatement.setString(5, utenteBean.getEmail());
        preparedStatement.setDate(6, Date.valueOf(utenteBean.getDataNascita()));
        preparedStatement.setString(7, utenteBean.getNumCarta());
        preparedStatement.setDate(8, Date.valueOf(utenteBean.getDataScadenza()));
        preparedStatement.setString(9, utenteBean.getCap());
        preparedStatement.setString(10, utenteBean.getVia());
        preparedStatement.setString(11, utenteBean.getCitta());
        preparedStatement.setString(12, utenteBean.getTipo());

    }
}