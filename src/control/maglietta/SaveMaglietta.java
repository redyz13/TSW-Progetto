package control.maglietta;

import model.maglietta.MagliettaBean;
import model.maglietta.MagliettaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.SQLException;

@WebServlet("/SaveMaglietta")
@MultipartConfig
public class SaveMaglietta extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "db" +
            File.separator + "grafiche" + File.separator;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome  = req.getParameter("nome");
        String colore = req.getParameter("colore");
        String tipo = req.getParameter("tipo");
        int IVA = Integer.parseInt(req.getParameter("IVA"));
        float prezzo = Float.parseFloat(req.getParameter("prezzo"));
        Part grafica = req.getPart("grafica");

        MagliettaDAO magliettaDAO = new MagliettaDAO();
        String nomeFile;
        int extensionIndex = grafica.getSubmittedFileName().indexOf(".");

        try {
            nomeFile = magliettaDAO.getMaxID() + 1 + tipo +
                    grafica.getSubmittedFileName().substring(extensionIndex);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String relativePath = "grafiche" + File.separator + nomeFile;

        try (OutputStream outputStream = new FileOutputStream(PATH + nomeFile); InputStream inputStream = grafica.getInputStream()) {
            inputStream.transferTo(outputStream);
        } catch (IOException e) {
            throw new RuntimeException();
        }

        MagliettaBean maglietta = new MagliettaBean();
        maglietta.setNome(nome);
        maglietta.setColore(colore);
        maglietta.setTipo(tipo);
        maglietta.setPrezzo(prezzo);
        maglietta.setIVA(IVA);
        maglietta.setGrafica(relativePath);

        try {
            magliettaDAO.doSave(maglietta);
        } catch (SQLException e) {
            throw new RuntimeException();
        }

        resp.sendRedirect("./Catalogo");
    }
}
