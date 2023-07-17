package model.misura;

import model.acquisto.AcquistoBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MisuraDAO {
    private static final String TABLE_NAME = "Misura";
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

    public void doSave(MisuraBean product) throws SQLException {
        String query = "INSERT INTO " + TABLE_NAME + " (IDMaglietta, taglia, quantita)" + " VALUES (?, ?, ?)";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, product.getIDMaglietta());
            preparedStatement.setString(2, product.getTaglia());
            preparedStatement.setInt(3, product.getQuantita());

            preparedStatement.executeUpdate();
        }
    }

    public void doUpdateUtente(AcquistoBean product, String taglia) throws SQLException {
        String query = "UPDATE " + TABLE_NAME +
                       " SET quantita = quantita - ? " +
                       "WHERE IDMaglietta = ? AND taglia = ?";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, product.getQuantita());
            preparedStatement.setInt(2, product.getIDMaglietta());
            preparedStatement.setString(3, taglia);

            preparedStatement.executeUpdate();
        }
    }
}
