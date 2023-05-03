package control.maglietta;

import model.maglietta.MagliettaDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;

@WebServlet("/DeleteMaglietta")
public class DeleteMaglietta extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "images" +
            File.separator + "grafiche" + File.separator;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ID = Integer.parseInt(req.getParameter("ID"));
        String tipo = req.getParameter("tipo");

        MagliettaDAO magliettaDAO = new MagliettaDAO();

        try {
            magliettaDAO.doDelete(ID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        File f = new File(PATH);
        String[] matching = f.list();
        if (matching != null) {
            for (String s : matching) {
                if (s.startsWith(String.valueOf(ID) + tipo))
                    Files.delete(Path.of(PATH + s));
            }
        }


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }
}