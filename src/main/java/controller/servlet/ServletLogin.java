package controller.servlet;

import controller.dao.DaoUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.BeanUsuario;

public class ServletLogin extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
    throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String msg = null;
        String redirect = null;

        if ((login != null) && (password != null)) {
            BeanUsuario bu = DaoUsuario.getUsuario(
                    login, password);

            if (bu != null) {
                HttpSession session =
                        request.getSession(true);
                session.setAttribute("usuario", bu);

                if (bu.getAutorizacion().compareTo(
                        "USER") == 0) {
                   redirect = "view/principal/principal.jsp";

                } else if (bu.getAutorizacion().compareTo(
                        "ADMIN") == 0) {

                  redirect = "view/principal/principal.jsp";
                }

            } else {
                msg = "Login Fallido... Datos NO VALIDOS";
                redirect = "mensaje.jsp";
            }

        } else {
            msg = "Ingreso incorrecto";
            redirect = "mensaje.jsp";
        }
        request.getSession().setAttribute("msg", msg);
        response.sendRedirect(redirect);
    } 

    // <editor-fold defaultstate="collapsed" desc="doGet() y doPost() de NetBeans">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

