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
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;

@WebServlet("/UpdateMaglietta")
@MultipartConfig
public class UpdateMaglietta extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "images" +
            File.separator + "grafiche" + File.separator;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ID = Integer.parseInt(req.getParameter("id"));
        String nome  = req.getParameter("nome");
        float prezzo = Float.parseFloat(req.getParameter("prezzo"));
        int IVA = (int) Float.parseFloat(req.getParameter("IVA"));
        String colore = req.getParameter("colore");
        String descrizione = req.getParameter("descrizione");
        String pathGrafica = req.getParameter("path");
        Part grafica = req.getPart("grafica");

        if (colore == null)
            colore = req.getParameter("coloreVecchio");
        String tipo = req.getParameter("tipo");
        if (tipo == null)
            tipo = req.getParameter("tipoVecchio");

        MagliettaDAO magliettaDAO = new MagliettaDAO();

        if (!grafica.getSubmittedFileName().equals("")) {
            // Aggiunta nuova grafica
            grafica = req.getPart("grafica");
            String nomeFile;
            int extensionIndex = grafica.getSubmittedFileName().lastIndexOf(".");

            nomeFile = ID + tipo + grafica.getSubmittedFileName().substring(extensionIndex);

            pathGrafica = "images" + File.separator + "grafiche" + File.separator + nomeFile;

            // Eliminazione vecchia grafica
            // TODO risolvere problema eliminazione (di qua in teoria è risolto)
            File f = new File(PATH);
            String[] matching = f.list();
            if (matching != null) {
                for (String s : matching) {
                    if (s.equals(nomeFile))
                        Files.delete(Path.of(PATH + s));
                }
            }

            try (OutputStream outputStream = new FileOutputStream(PATH + nomeFile); InputStream inputStream = grafica.getInputStream()) {
                inputStream.transferTo(outputStream);
            } catch (IOException e) {
                throw new RuntimeException();
            }
        }

        MagliettaBean maglietta = new MagliettaBean();
        maglietta.setID(ID);
        maglietta.setNome(nome);
        maglietta.setPrezzo(prezzo);
        maglietta.setIVA(IVA);
        maglietta.setColore(colore);
        maglietta.setTipo(tipo);
        maglietta.setDescrizione(descrizione);
        maglietta.setGrafica(pathGrafica);

        try {
            magliettaDAO.doUpdate(maglietta);
        } catch (SQLException e) {
            throw new RuntimeException();
        }

        resp.sendRedirect("./StampaMaglietta?id=" + ID);
    }
}
