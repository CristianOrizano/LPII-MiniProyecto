package interfaces;

import java.util.ArrayList;

import entidad.Empleado;

public interface EmpleadoDAO {
    //insert
	public int insert(Empleado em);
	//delete
	public int delete(int cod);
	//update
	public int update(Empleado em);
	//select
	public ArrayList<Empleado> lisall(); 
	//buscar
	public Empleado busq(int cod);
	
}
