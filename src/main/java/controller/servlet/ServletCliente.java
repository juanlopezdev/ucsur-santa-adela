
package controller.servlet;
import controller.dao.DaoCliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BeanCliente;

public class ServletCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        String msg = null;

        if (accion == null) {
            msg = "Ingreso incorrecto!";

        } else if (accion.compareTo("INS") == 0) {
           String codigo = request.getParameter("codigo");
           String razonsocial = request.getParameter("razonsocial");
           String ruc = request.getParameter("RUC");
           String direccion = request.getParameter("direccion");
           String zona = request.getParameter("zona");
           String giro = request.getParameter("Giro");
           String tipo_cuenta = request.getParameter("Tipo_Cuenta");
           String estado = request.getParameter("Estado");
           
            BeanCliente bp = new BeanCliente();
            bp.setCodigo(codigo);
            bp.setRazon_Social(razonsocial);
            bp.setRuc(ruc);
            bp.setDireccion(direccion);
            bp.setZona(zona);
            bp.setGiro(giro);
            bp.setTipo_Cuenta(tipo_cuenta);
            bp.setEstado(estado);
            msg = DaoCliente.insert(bp);   
            if (msg == null) {  // INS, DEL, UPD correctos
                response.sendRedirect("view/cliente/clienteQRY.jsp");
            } else {
                msg = "Error... no se guardo registro 1!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }

        } else if (accion.compareTo("DEL") == 0) {
            String codigo = request.getParameter("codigo");
            BeanCliente bp = new BeanCliente();
            bp.setCodigo(codigo);
            msg = DaoCliente.delete(bp);       
            if (msg == null) {  // INS, DEL, UPD correctos
               response.sendRedirect("view/cliente/clienteQRY.jsp");
            } else {
                msg = "Error... no se Borro registro!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }

        } else if (accion.compareTo("UPD") == 0) {
           String codigo = request.getParameter("codigo");
           String razon_social = request.getParameter("razonsocial");
           String ruc = request.getParameter("RUC");
           String direccion = request.getParameter("direccion");
           String zona = request.getParameter("zona");
           String giro = request.getParameter("Giro");
           String tipo_cuenta = request.getParameter("Tipo_Cuenta");
           String estado = request.getParameter("Estado");
           
            BeanCliente bp = new BeanCliente();
            bp.setCodigo(codigo);
            bp.setRazon_Social(razon_social);
            bp.setRuc(ruc);
            bp.setDireccion(direccion);
            bp.setZona(zona);
            bp.setGiro(giro);
            bp.setTipo_Cuenta(tipo_cuenta);
            bp.setEstado(estado);
            msg = DaoCliente.insert(bp);
            msg = DaoCliente.update(bp);
            
            if (msg == null) {  // INS, DEL, UPD correctos   
                response.sendRedirect("view/cliente/clienteQRY.jsp");
            } else {
                msg = "Error... no se Actualizo registro!";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("mensaje.jsp");
            }
        
        } 
         else {
            msg = "Solicitud incorrecta!";
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("mensaje.jsp");

        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
