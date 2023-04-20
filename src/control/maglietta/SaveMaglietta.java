package control.maglietta;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet("/SaveMaglietta")
@MultipartConfig
public class SaveMaglietta extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "db" +
            File.separator + "grafiche" + File.separator;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part grafica = req.getPart("grafica");
        String nomeFile = grafica.getSubmittedFileName();

        InputStream inputStream = null;
        OutputStream outputStream = null;
        PrintWriter printWriter = resp.getWriter();

        try {
            outputStream = new FileOutputStream(PATH + nomeFile);
            inputStream = grafica.getInputStream();
            inputStream.transferTo(outputStream);
        } catch (IOException e) {
            // TODO cose di debug
            printWriter.println("Non è stato trovato il file " + nomeFile + " " + PATH);
        } finally {
            if (inputStream != null)
                inputStream.close();
            if (outputStream != null)
                outputStream.close();
            if (printWriter != null)
                printWriter.close();
        }
    }
}
