package control;

import model.acquisto.AcquistoBean;
import model.ordine.OrdineBean;
import model.utente.UtenteBean;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/StampaFattura")
public class StampaFattura extends HttpServlet {
    private static final String PATH = System.getenv("WHITEE_ROOT") + File.separator + "pdf" +
            File.separator;
    private static final String fileName = "fattura.pdf";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PDDocument document = PDDocument.load(new File(PATH + fileName))) {
            UtenteBean utenteBean = (UtenteBean) req.getSession().getAttribute("utente");
            Map<OrdineBean, Collection<AcquistoBean>> ordini = (Map<OrdineBean, Collection<AcquistoBean>>) req.getAttribute("ordini");

            PDPage page = document.getPage(0);
            PDRectangle pageSize = page.getMediaBox();

            PDPageContentStream contentStream = new PDPageContentStream(document, page);
            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);

            contentStream.beginText();
            
            contentStream.endText();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
