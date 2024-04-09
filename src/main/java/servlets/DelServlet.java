package servlets;

import entity.Note;
import helper.HibernateFactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DelServlet", value = "/DelServlet")
public class DelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int noteId=Integer.parseInt(request.getParameter("note_id").trim());
        Session s = HibernateFactoryProvider.getFactory().openSession();
        Transaction trans = s.beginTransaction();
        Note note = s.get(Note.class, noteId);
        s.delete(note);
        trans.commit();
        s.close();
        response.sendRedirect("all_notes.jsp");
    }

}