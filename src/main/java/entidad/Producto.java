package entidad;

public class Producto {
	
	public int codigo ,ide_cat ,stock;
	public String nombre,Marca,nombCate;
	public double precio;
	//metodos de acceso
	
	public String getNombCate() {
		return nombCate;
	}
	public void setNombCate(String nombCate) {
		this.nombCate = nombCate;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getIde_cat() {
		return ide_cat;
	}
	public void setIde_cat(int ide_cat) {
		this.ide_cat = ide_cat;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getMarca() {
		return Marca;
	}
	public void setMarca(String marca) {
		Marca = marca;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	 

}
