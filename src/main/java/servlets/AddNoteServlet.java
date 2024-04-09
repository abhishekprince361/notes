package servlets;

import entity.Note;
import helper.HibernateFactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet("/addnote")
public class AddNoteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Note newNote = new Note(title, content, LocalDate.now());

        Session ses = HibernateFactoryProvider.getFactory().openSession();
        Transaction tx = ses.beginTransaction();
        ses.save(newNote);
        tx.commit();
        ses.close();
        response.setContentType("text/html");
//        PrintWriter pw = response.getWriter();
//        pw.println("<h1>Note is added<h1>");
        response.sendRedirect("all_notes.jsp");

    }
}