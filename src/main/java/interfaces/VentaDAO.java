package interfaces;

import java.util.ArrayList;

import entidad.Boleta;
import entidad.DetalleBoleta;

public interface VentaDAO {
	
	  //=================== para venta
	//generar codigo boleta
	 public String gencodiBol();
	//insert a boleta y detalle
	 public int insBolyDeta(Boleta bo, ArrayList<DetalleBoleta> detbo);

}
