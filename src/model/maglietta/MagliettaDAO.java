package model.maglietta;

import model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class MagliettaDAO implements DAOInterface<MagliettaBean> {
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

    // Restituisce un oggetto maglietta con delle caratteristiche (SQL SELECT)
    @Override
    public synchronized MagliettaBean doRetrieveByKey(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        MagliettaBean magliettaBean = new MagliettaBean();

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE ID = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, code);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            setMaglietta(resultSet, magliettaBean);
        } finally {
            if (preparedStatement!= null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return magliettaBean;
    }

     // Resituisce una collezione di magliette che soddisfano una condizione (SQL ORDER BY)
    @Override
    public Collection<MagliettaBean> doRetriveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<MagliettaBean> magliette = new ArrayList<>();
        
        String query = "SELECT * FROM " + TABLE_NAME;

        if (order != null && !order.equals("")) {
            query += " ORDER BY " + order;
        }

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MagliettaBean magliettaBean = new MagliettaBean();

                setMaglietta(resultSet, magliettaBean);

                magliette.add(magliettaBean);
            }

        } finally {
            if (preparedStatement!= null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return magliette;
    }

    // Salva i dati dell'oggetto maglietta nel database (SQL Insert)
    @Override
    public void doSave(MagliettaBean maglietta) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        String query = "INSERT INTO " + TABLE_NAME + " (nome, prezzo, IVA, colore, tipo, grafica, descrizione)" + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);

            setMagliettaStatement(maglietta, preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Aggiorna i dati dell'ogetto maglietta nel database (SQL UPDATE)
    @Override
    public void doUpdate(MagliettaBean maglietta) throws SQLException {
        Connection connection;
        PreparedStatement preparedStatement;

        String query = "UPDATE " + TABLE_NAME +
                       " SET nome = ?, prezzo = ?, IVA = ?, colore = ?, tipo = ?, grafica = ?, descrizione = ? " +
                       "WHERE ID = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);

            setMagliettaStatement(maglietta, preparedStatement);
            preparedStatement.setInt(8, maglietta.getID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Cancella i dati dell'oggetto maglietta dal database (SQL DELETE)
    @Override
    public boolean doDelete(int code) throws SQLException {
        int result;

        String query = "DELETE FROM " + TABLE_NAME + " WHERE ID = ?";

        // TODO Controllo ID?

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, code);

            result = preparedStatement.executeUpdate();
        }

        return result != 0;
    }

    private void setMaglietta(ResultSet resultSet, MagliettaBean magliettaBean) throws SQLException {
        magliettaBean.setID(resultSet.getInt("ID"));
        magliettaBean.setNome(resultSet.getString("nome"));
        magliettaBean.setPrezzo(resultSet.getFloat("prezzo"));
        magliettaBean.setIVA(resultSet.getInt("IVA"));
        magliettaBean.setColore(resultSet.getString("colore"));
        magliettaBean.setTipo(resultSet.getString("tipo"));
        magliettaBean.setGrafica(resultSet.getString("grafica"));
        magliettaBean.setDescrizione(resultSet.getString("descrizione"));
    }

    private void setMagliettaStatement(MagliettaBean maglietta, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, maglietta.getNome());
        preparedStatement.setFloat(2, maglietta.getPrezzo());
        preparedStatement.setInt(3, maglietta.getIVA());
        preparedStatement.setString(4, maglietta.getColore());
        preparedStatement.setString(5, maglietta.getTipo());
        preparedStatement.setString(6, maglietta.getGrafica());
        preparedStatement.setString(7, maglietta.getDescrizione());
    }

    public int getMaxID() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String sessionCacheQuery = "SET @@SESSION.information_schema_stats_expiry = 0;";
        String query = "SELECT AUTO_INCREMENT " +
                       "FROM information_schema.tables WHERE table_name = '" + TABLE_NAME +
                       "' AND table_schema = 'whiTee'";

        int ID;

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);
            connection.createStatement().execute(sessionCacheQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            ID = resultSet.getInt("AUTO_INCREMENT");
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return ID;
    }
}
