package servlets;

import entity.Note;
import helper.HibernateFactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/updateNote")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int id = Integer.parseInt(request.getParameter("id").trim());

        Session s = HibernateFactoryProvider.getFactory().openSession();
        Transaction trans = s.beginTransaction();

        Note note =  s.get(Note.class, id);
        note.setTitle(title);
        note.setContent(content);
        note.setDate(LocalDate.now());

        trans.commit();
        s.close();
        response.sendRedirect("all_notes.jsp");


    }
}