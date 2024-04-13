package servlets;

import entity.Note;
import helper.HibernateFactoryProvider;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title1 = request.getParameter("title");
        Session s = HibernateFactoryProvider.getFactory().openSession();
        Query query = s.createQuery("select n from Note n where n.title=?1");
        query.setParameter(1, title1);
        List<Note> listNote = query.list();
        if(!listNote.isEmpty()) {
            request.setAttribute("note",listNote);
            RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
            rd.forward(request, response);
        }
        else{
            request.setAttribute("title", title1);
            RequestDispatcher rd = request.getRequestDispatcher("NotFound.jsp");
            rd.forward(request, response);
        }


    }

}