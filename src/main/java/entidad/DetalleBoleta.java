package entidad;

public class DetalleBoleta {
	
	public String num_bol;
	public int codigo_elc,cantidad;
	public double importe;
	//esto atributos es para visualizar en detalle
	//no va en Base datos
	public String nompro;
	public Double precio;
	
	//metodos acceso
	
	public String getNompro() {
		return nompro;
	}
	public void setNompro(String nompro) {
		this.nompro = nompro;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public String getNum_bol() {
		return num_bol;
	}
	public void setNum_bol(String num_bol) {
		this.num_bol = num_bol;
	}
	public int getCodigo_elc() {
		return codigo_elc;
	}
	public void setCodigo_elc(int codigo_elc) {
		this.codigo_elc = codigo_elc;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public double getImporte() {
		return importe;
	}
	public void setImporte(double importe) {
		this.importe = importe;
	}
	
	
	

}
