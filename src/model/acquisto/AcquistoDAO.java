package model.acquisto;

import model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Collection;

public class AcquistoDAO implements DAOInterface<AcquistoBean, Integer> {
    private static final String TABLE_NAME = "Ordine";
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
    public AcquistoBean doRetrieveByKey(Integer code) throws SQLException {
        AcquistoBean acquistoBean = new AcquistoBean();

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE IDOrdine = ? && ID";

//        try( Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//            ResultSet resultSet = preparedStatement.executeQuery();
//
//            setOrders(resultSet,ordineBean);
//        }
//
//        return ordineBean;
        return null;
    }

    @Override
    public Collection<AcquistoBean> doRetriveAll(String order) throws SQLException {
        return null;
    }

    @Override
    public void doSave(AcquistoBean product) throws SQLException {

    }

    @Override
    public void doUpdate(AcquistoBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(Integer code) throws SQLException {
        return false;
    }
}
