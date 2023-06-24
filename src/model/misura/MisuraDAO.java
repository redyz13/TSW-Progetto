package model.misura;

import model.DAOInterface;

import java.sql.SQLException;
import java.util.Collection;

public class MisuraDAO implements DAOInterface<MisuraBean, Integer> {

    @Override
    public MisuraBean doRetrieveByKey(Integer code) throws SQLException {
        return null;
    }

    @Override
    public Collection<MisuraBean> doRetriveAll(String order) throws SQLException {
        return null;
    }

    @Override
    public void doSave(MisuraBean product) throws SQLException {

    }

    @Override
    public void doUpdate(MisuraBean product) throws SQLException {

    }

    @Override
    public boolean doDelete(Integer code) throws SQLException {
        return false;
    }
}
