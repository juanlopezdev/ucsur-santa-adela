package controller.servlet;

import controller.dao.DaoUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BeanUsuario;

public class ServletUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String msg = null;

        if (accion == null) {
            msg = "Ingreso incorrecto!";

        } else if (accion.compareTo("INS") == 0) {
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String autorizacion
            = request.getParameter("autorizacion");
            BeanUsuario bu = new BeanUsuario();
            bu.setNombres(nombres);
            bu.setApellidos(apellidos);
            bu.setLogin(login);
            bu.setPassword(password);
            bu.setAutorizacion(autorizacion);

            msg = DaoUsuario.insert(bu);
            
            if (msg == null) {  // INS, DEL, UPD correctos
                
                response.sendRedirect("view/usuarios/accesoAdmin.jsp");

            } else {
                msg = "Algo Salio mal!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }

           

        } else if (accion.compareTo("DEL") == 0) {
            String idUsuario = request.getParameter("idUsuario");
            BeanUsuario bu = new BeanUsuario();
            bu.setIdUsuario(idUsuario);

            msg = DaoUsuario.delete(bu);
            
            if (msg == null) {  // INS, DEL, UPD correctos
                
                response.sendRedirect("view/usuarios/accesoAdmin.jsp");

            } else {
                msg = "Algo Salio mal!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }
           
            
            

        } else if (accion.compareTo("UPD") == 0) {
            String idUsuario = request.getParameter("idUsuario");
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String autorizacion = request.getParameter("autorizacion");

            BeanUsuario bu = new BeanUsuario();
            bu.setIdUsuario(idUsuario);
            bu.setNombres(nombres);
            bu.setApellidos(apellidos);
            bu.setLogin(login);
            bu.setPassword(password);
            bu.setAutorizacion(autorizacion);

            msg = DaoUsuario.update(bu);
            
            if (msg == null) {  // INS, DEL, UPD correctos
                
                response.sendRedirect("view/usuarios/accesoAdmin.jsp");

            } else {
                msg = "Algo Salio mal!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }
            
          
            

        } else if (accion.compareTo("QRY")==0){
            
            BeanUsuario usuario = (BeanUsuario) request.getSession().getAttribute("usuario");
            
            
           // System.out.println("autorizacion:"+usuario.getAutorizacion().toString());
            
            if (usuario.getAutorizacion().compareTo("ADMIN")==0){
             //   msg = "Solicitud incorrecta!";
               // request.getSession().setAttribute("msg", msg);
                response.sendRedirect("view/usuarios/accesoAdmin.jsp");
                
            }else{
               // msg = "Solicitud incorrecta!";
                //request.getSession().setAttribute("msg", msg);
                response.sendRedirect("view/usuarios/accesoUser.jsp");
            }
            
        }
        else if (accion.compareTo("AUT") == 0) {
            String idUsuario = request.getParameter("idUsuario");
            String autorizacion
                    = request.getParameter("autorizacion");

            BeanUsuario bu = new BeanUsuario();
            bu.setIdUsuario(idUsuario);
            bu.setAutorizacion(autorizacion);

            msg = DaoUsuario.updateAutorizacion(bu);
            
            if (msg == null) {  // INS, DEL, UPD correctos
                
                response.sendRedirect("view/usuarios/accesoAdmin.jsp");

            } else {
                msg = "Algo Salio mal!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }

            //retornar a la lista
        } else {
            msg = "Solicitud incorrecta!";
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("mensaje.jsp");

        }
        
         

    }

    // <editor-fold defaultstate="collapsed" desc="doGet() y doPost() por NetBeans">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
