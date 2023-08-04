package interfaces;

import java.util.ArrayList;

import entidad.Administrador;
import entidad.Ciudad;
import entidad.Empleado;

public interface AdministradorDAO {
	
	 //insert
		public int insert(Administrador ad);
		//delete
		public int delete(String cod);
		//update
		public int update(Administrador ad);
		//select
		public ArrayList<Administrador> lisall(); 
		//buscar para login
		public Administrador login(String login, String con);
		//buscar para bton traer datos(editar)
		public Administrador buscar(String cod);
		//generar codigo admi
		public String gencodi();
		//listar combo ciudad
		public ArrayList<Ciudad> listar();

}
