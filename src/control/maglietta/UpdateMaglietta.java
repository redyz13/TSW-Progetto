package control.maglietta;

import model.maglietta.MagliettaBean;
import model.maglietta.MagliettaDAO;

import javax.servlet.ServletException;
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
public class UpdateMaglietta extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "images" +
            File.separator + "grafiche" + File.separator;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ID = Integer.parseInt(req.getParameter("id"));
        String nome  = req.getParameter("nome");
        float prezzo = Float.parseFloat(req.getParameter("prezzo"));
        int IVA = Integer.parseInt(req.getParameter("IVA"));
        String colore = req.getParameter("colore");
        String tipo = req.getParameter("tipo");
        String descrizione = req.getParameter("descrizione");
        String pathGrafica = req.getParameter("path");
        Part grafica;

        MagliettaDAO magliettaDAO = new MagliettaDAO();

        if (req.getParameter("grafica") != null) {
            // Eliminazione vecchia grafica
            File f = new File(PATH);
            String[] matching = f.list();
            if (matching != null) {
                for (String s : matching) {
                    if (s.startsWith(String.valueOf(ID)))
                        Files.delete(Path.of(PATH + s));
                }
            }

            // Aggiunta nuova grafica
            grafica = req.getPart("grafica");
            String nomeFile;
            int extensionIndex = grafica.getSubmittedFileName().lastIndexOf(".");

            nomeFile = ID + tipo + grafica.getSubmittedFileName().substring(extensionIndex);

            pathGrafica = "images" + File.separator + "grafiche" + File.separator + nomeFile;

            try (OutputStream outputStream = new FileOutputStream(PATH + nomeFile); InputStream inputStream = grafica.getInputStream()) {
                inputStream.transferTo(outputStream);
            } catch (IOException e) {
                throw new RuntimeException();
            }
        }

        MagliettaBean maglietta = new MagliettaBean();
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
