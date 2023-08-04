package entidad;

public class Administrador {
	public String cod_adm,nombre,
	apellido,direccion,sexo,fecha_nac,cod_ciu,nomciu;
	public int telefono;
	
	//metodos de acceso

	public String getNomciu() {
		return nomciu;
	}

	public void setNomciu(String nomciu) {
		this.nomciu = nomciu;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public String getCod_adm() {
		return cod_adm;
	}

	public void setCod_adm(String cod_adm) {
		this.cod_adm = cod_adm;
	}

	public String getNombre() {
		return nombre;
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

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getFecha_nac() {
		return fecha_nac;
	}

	public void setFecha_nac(String fecha_nac) {
		this.fecha_nac = fecha_nac;
	}

	public String getCod_ciu() {
		return cod_ciu;
	}

	public void setCod_ciu(String cod_ciu) {
		this.cod_ciu = cod_ciu;
	}
	
	

}
