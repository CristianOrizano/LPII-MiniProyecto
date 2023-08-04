package se_listener;

import java.util.ArrayList;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import entidad.DetalleBoleta;

/**
 * Application Lifecycle Listener implementation class ProdVentaListener
 *
 */
@WebListener
public class ProdVentaListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public ProdVentaListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         
     /*  //se ejecuta antes de cualquier servlet /al cargar el app
    	System.out.println("Empezo a escuchar....");
    	//esto se ejecuta mucho antes de cualquier servlet
    	//estamos definiendo esta varibles las cual nos va servir para
    	//llevar control de lo que compremos
    	ArrayList<DetalleBoleta> carro= new ArrayList<DetalleBoleta>();
    	int cantArticulos =0;
    	double SubTotalVenta= 0.0;
    	//enviar los objetos a nivel de secion
    	//de tal manera como si fuera variable global
    	arg0.getSession().setAttribute("carro",carro); //guardamos los elementos detalle en un array
    	arg0.getSession().setAttribute("cantArticulos", cantArticulos); //cantidad de articulos
    	arg0.getSession().setAttribute("SubTotalVenta", SubTotalVenta);//acumulado del total            */	
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
