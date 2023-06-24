package model.acquisto;

import model.DAOInterface;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

public class AcquistoDAO implements DAOInterface<AcquistoBean, Integer> {
    private static final String TABLE_NAME = "Acquisto";
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

        String query = "SELECT * FROM " + TABLE_NAME + " WHERE IDAcquisto = ?";

        try(Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            setAcquisto(resultSet, acquistoBean);
        }

        return acquistoBean;
    }

    @Override
    public Collection<AcquistoBean> doRetriveAll(String order) throws SQLException {
        return null;
    }

    @Override
    public void doSave(AcquistoBean acquistoBean) throws SQLException {
        String query =  "INSERT INTO " + TABLE_NAME + " (IDOrdine, IDMaglietta, quantita, immagine, prezzoAq, ivaAq) "+
                        "VALUES(?, ?, ?, ?, ?, ?)";

        try(Connection connection = ds.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            setAcquistoStatement(acquistoBean, preparedStatement);

            preparedStatement.executeUpdate();
        }

    }

    @Override
    public void doUpdate(AcquistoBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(Integer code) throws SQLException {
        return false;
    }

    private void setAcquisto(ResultSet resultSet, AcquistoBean acquistoBean) throws SQLException {
       acquistoBean.setIDAcquisto(resultSet.getInt("IDAcquisto"));
       acquistoBean.setIDOrdine(resultSet.getInt("IDOrdine"));
       acquistoBean.setIDAcquisto(resultSet.getInt("IDMaglietta"));
       acquistoBean.setIDAcquisto(resultSet.getInt("quantita"));
       acquistoBean.setImmagine(resultSet.getString("immagine"));
       acquistoBean.setPrezzoAq(resultSet.getFloat("prezzoAq"));
       acquistoBean.setIvaAq(resultSet.getInt("ivaAq"));
    }

    private void setAcquistoStatement(AcquistoBean acquistoBean, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setInt(1, acquistoBean.getIDOrdine());
        preparedStatement.setInt(2, acquistoBean.getIDMaglietta());
        preparedStatement.setInt(3, acquistoBean.getQuantita());
        preparedStatement.setString(4, acquistoBean.getImmagine());
        preparedStatement.setFloat(5, acquistoBean.getPrezzoAq());
        preparedStatement.setInt(6, acquistoBean.getIvaAq());
    }
}
