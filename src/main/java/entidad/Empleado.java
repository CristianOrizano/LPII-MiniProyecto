package entidad;

public class Empleado {
	
	public String nombre,apellido;
    public double sueldo;
    public int numhi,codiEm;
    //metodos de acceso
    
	public String getNombre() {
		return nombre;
	}
	public int getCodiEm() {
		return codiEm;
	}
	public void setCodiEm(int codiEm) {
		this.codiEm = codiEm;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public double getSueldo() {
		return sueldo;
	}
	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}
	public int getNumhi() {
		return numhi;
	}
	public void setNumhi(int numhi) {
		this.numhi = numhi;
	}
    
    
}
