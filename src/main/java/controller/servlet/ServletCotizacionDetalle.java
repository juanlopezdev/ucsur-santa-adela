package controller.servlet;

import controller.dao.DaoCotizacionDetalle;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BeanCotizacionDetalle;

public class ServletCotizacionDetalle extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String accion = request.getParameter("accion");
    String msg = null;

    if (accion == null) {
      msg = "Ingreso incorrecto!";

    } else if (accion.compareTo("INS") == 0) {
      int codCotizacion = Integer.parseInt(request.getParameter("cod_cotizacion"));
      int codTarifario = Integer.parseInt(request.getParameter("cod_tarifario"));
      int cantidad = Integer.parseInt(request.getParameter("cantidad"));
      int nroitem = Integer.parseInt(request.getParameter("nroitem"));
      double subtotal = Double.parseDouble(request.getParameter("subtotal"));
      double igv = Double.parseDouble(request.getParameter("igv"));
      double total = Double.parseDouble(request.getParameter("total"));

      BeanCotizacionDetalle bp = new BeanCotizacionDetalle();
      bp.setCodCotizacion(codCotizacion);
      bp.setCodTarifario(codTarifario);
      bp.setCantidad(cantidad);
      bp.setNroitem(nroitem);
      bp.setSubtotal(subtotal);
      bp.setIgv(igv);
      bp.setTotal(total);
      msg = DaoCotizacionDetalle.insert(bp);

      if (msg == null) {  // INS, DEL, UPD correctos
        response.sendRedirect("view/cotizacion-detalle/cotizacionDetalleQRY.jsp");
      } else {
        request.getSession().setAttribute("msg", msg);
        response.sendRedirect("mensaje.jsp");
      }

    } else if (accion.compareTo("DEL") == 0) {
      int codCotizacion = Integer.parseInt(request.getParameter("cod_cotizacion"));
      int codTarifario = Integer.parseInt(request.getParameter("cod_tarifario"));
      BeanCotizacionDetalle bp = new BeanCotizacionDetalle();
      bp.setCodCotizacion(codCotizacion);
      bp.setCodTarifario(codTarifario);
      msg = DaoCotizacionDetalle.delete(bp);
      if (msg == null) {  // INS, DEL, UPD correctos
        response.sendRedirect("view/cotizacion-detalle/cotizacionDetalleQRY.jsp");
      } else {
        msg = "Error... no se Borro registro!";
        request.getSession().setAttribute("msg", msg);
        response.sendRedirect("mensaje.jsp");
      }

    } else if (accion.compareTo("UPD") == 0) {
      int codCotizacion = Integer.parseInt(request.getParameter("cod_cotizacion"));
      int codTarifario = Integer.parseInt(request.getParameter("cod_tarifario"));
      int cantidad = Integer.parseInt(request.getParameter("cantidad"));
      int nroitem = Integer.parseInt(request.getParameter("nroitem"));
      double subtotal = Double.parseDouble(request.getParameter("subtotal"));
      double igv = Double.parseDouble(request.getParameter("igv"));
      double total = Double.parseDouble(request.getParameter("total"));

      BeanCotizacionDetalle bp = new BeanCotizacionDetalle();
      bp.setCodCotizacion(codCotizacion);
      bp.setCodTarifario(codTarifario);
      bp.setNroitem(nroitem);
      bp.setCantidad(cantidad);
      bp.setSubtotal(subtotal);
      bp.setIgv(igv);
      bp.setTotal(total);
      msg = DaoCotizacionDetalle.update(bp);

      if (msg == null) {  // INS, DEL, UPD correctos   
        response.sendRedirect("view/cotizacion-detalle/cotizacionDetalleQRY.jsp");
      } else {
        msg = "Error... no se Actualizo registro!";
        request.getSession().setAttribute("msg", msg);
        response.sendRedirect("mensaje.jsp");
      }

    } else {
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
