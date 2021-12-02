package model;

public class BeanCotizacion {

  private int codCotizacion;
  private int codCliente;
  private int idUsuario;
  private String fechaCotizacion;
  private double subtotal;
  private double igv;
  private double total;
  private String estadoCotizacion;

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
   * @return the codCliente
   */
  public int getCodCliente() {
    return codCliente;
  }

  /**
   * @param codCliente the codCliente to set
   */
  public void setCodCliente(int codCliente) {
    this.codCliente = codCliente;
  }

  /**
   * @return the idUsuario
   */
  public int getIdUsuario() {
    return idUsuario;
  }

  /**
   * @param idUsuario the idUsuario to set
   */
  public void setIdUsuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }

  /**
   * @return the fechaCotizacion
   */
  public String getFechaCotizacion() {
    return fechaCotizacion;
  }

  /**
   * @param fechaCotizacion the fechaCotizacion to set
   */
  public void setFechaCotizacion(String fechaCotizacion) {
    this.fechaCotizacion = fechaCotizacion;
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
   * @return the estadoCotizacion
   */
  public String getEstadoCotizacion() {
    return estadoCotizacion;
  }

  /**
   * @param estadoCotizacion the estadoCotizacion to set
   */
  public void setEstadoCotizacion(String estadoCotizacion) {
    this.estadoCotizacion = estadoCotizacion;
  }

}
