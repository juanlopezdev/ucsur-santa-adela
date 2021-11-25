
package model;

public class BeanCliente {
    private String codigo;
    private String razonsocial  ;
    private String ruc;
    private String direccion;
    private String zona;
    private String giro;
    private String tipo_cuenta;
    private String estado;
   
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getRazon_Social() {
        return razonsocial;
    }

    public void setRazon_Social(String razonsocial) {
        this.razonsocial = razonsocial;
    }
      public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    
     public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }
    public String getGiro() {
        return giro;
    }

    public void setGiro(String giro) {
        this.giro = giro;
    }
    public String getTipo_Cuenta() {
        return tipo_cuenta;
    }

    public void setTipo_Cuenta(String tipo_cuenta) {
        this.tipo_cuenta = tipo_cuenta;
    }
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}

    