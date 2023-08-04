package interfaces;

import java.util.ArrayList;

import entidad.Administrador;
import entidad.Boleta;
import entidad.Categoria;
import entidad.Ciudad;
import entidad.DetalleBoleta;
import entidad.Producto;

public interface ProductoDAO {
	
	        //insert
			public int insert(Producto pr);
			//delete
			public int delete(int cod);
			//update
			public int update(Producto pr);
			//select
			public ArrayList<Producto> lisall(); 
			//buscar para bton traer datos(editar)
			public Producto buscar(int cod);
			//buscar para bton agregar de catalogo
			public Producto buscarca(int cod);
			//generar codigo produ
			public int gencodi();
			//listar combo categoria
			public ArrayList<Categoria> listar();
			//hacer filtro por categoria parametro
			public ArrayList<Producto> consCate(int codcat);
			
			
		  

}
