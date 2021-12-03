package model;

public class BeanCotizacionDetalle {

  private int codCotizacion;
  private int codTarifario;
  private int cantidad;
  private double subtotal;
  private double igv;
  private double total;
  private int nroitem;

  /**
   * @return the codCotizacion
   */
  public int getCodCotizacion() {
    return codCotizacion;
  }

  /**
   * @param codCotizacion the codCotizacion to set
   */
  public void setCodCotizacion(int codCotizacion) {
    this.codCotizacion = codCotizacion;
  }

  /**
   * @return the codTarifario
   */
  public int getCodTarifario() {
    return codTarifario;
  }

  /**
   * @param codTarifario the codTarifario to set
   */
  public void setCodTarifario(int codTarifario) {
    this.codTarifario = codTarifario;
  }

  /**
   * @return the cantidad
   */
  public int getCantidad() {
    return cantidad;
  }

  /**
   * @param cantidad the cantidad to set
   */
  public void setCantidad(int cantidad) {
    this.cantidad = cantidad;
  }

  /**
   * @return the subtotal
   */
  public double getSubtotal() {
    return subtotal;
  }

  /**
   * @param subtotal the subtotal to set
   */
  public void setSubtotal(double subtotal) {
    this.subtotal = subtotal;
  }

  /**
   * @return the igv
   */
  public double getIgv() {
    return igv;
  }

  /**
   * @param igv the igv to set
   */
  public void setIgv(double igv) {
    this.igv = igv;
  }

  /**
   * @return the total
   */
  public double getTotal() {
    return total;
  }

  /**
   * @param total the total to set
   */
  public void setTotal(double total) {
    this.total = total;
  }

  /**
   * @return the nroitem
   */
  public int getNroitem() {
    return nroitem;
  }

  /**
   * @param nroitem the nroitem to set
   */
  public void setNroitem(int nroitem) {
    this.nroitem = nroitem;
  }
 
  
}
