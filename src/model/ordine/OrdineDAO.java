package model.ordine;

import model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class OrdineDAO implements DAOInterface<OrdineBean, Integer> {
    private static final String TABLE_NAME = "Ordine";
    private static final DataSource ds;
    private static final List<String> ORDERS = new ArrayList<>(Arrays.asList("username", "dataOrdine"));

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
    public OrdineBean doRetrieveByKey(Integer code) throws SQLException {
        OrdineBean ordineBean = new OrdineBean();

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE ID = ?";

        try(Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();

          setOrders(resultSet,ordineBean);
        }

        return ordineBean;
    }

    @Override
    public Collection<OrdineBean> doRetriveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<OrdineBean> ordini = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT * FROM " + TABLE_NAME);

        try {
            connection = ds.getConnection();

            for (String s: ORDERS)
                if (s.equals(order))
                    query.append(" ORDER BY ").append(s);

            preparedStatement = connection.prepareStatement(query.toString());

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OrdineBean ordineBean = new OrdineBean();

                setOrders(resultSet,ordineBean);

                ordini.add(ordineBean);
            }

        } finally {
            if (preparedStatement!= null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return ordini;
    }

    @Override
    public void doSave(OrdineBean ordineBean) throws SQLException {
        String query = "INSERT INTO " + TABLE_NAME + " (username, prezzoTotale, dataConsegna, dataOrdine, cap, via, citta) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            setOrdineStatement(ordineBean, preparedStatement);

            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void doUpdate(OrdineBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(Integer code) throws SQLException {
        return false;
    }

    public int getMaxID() throws SQLException {
        String sessionCacheQuery = "SET @@SESSION.information_schema_stats_expiry = 0;";
        String query = "SELECT AUTO_INCREMENT " +
                "FROM information_schema.tables WHERE table_name = '" + TABLE_NAME +
                "' AND table_schema = 'whiTee'";

        int ID;

        try (Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            connection.createStatement().execute(sessionCacheQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            ID = resultSet.getInt("AUTO_INCREMENT");
        }

        return ID;
    }

    private void setOrders(ResultSet resultSet, OrdineBean ordineBean) throws SQLException {
        ordineBean.setID(resultSet.getString("ID"));
        ordineBean.setUsername(resultSet.getString("username"));
        ordineBean.setPrezzoTotale(resultSet.getFloat("prezzoTotale"));
        ordineBean.setDataConsegna(resultSet.getDate("dataConsegna").toLocalDate());
        ordineBean.setDataOrdine(resultSet.getDate("dataOrdine").toLocalDate());
        ordineBean.setCap(resultSet.getString("cap"));
        ordineBean.setVia(resultSet.getString("via"));
        ordineBean.setCitta(resultSet.getString("citta"));
    }

    private void setOrdineStatement(OrdineBean ordineBean, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, ordineBean.getUsername());
        preparedStatement.setFloat(2, ordineBean.getPrezzoTotale());
        preparedStatement.setDate(3, Date.valueOf(LocalDate.now().plusDays(10)));
        preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));
        preparedStatement.setString(5, ordineBean.getCap());
        preparedStatement.setString(6, ordineBean.getCitta());
    }
}
