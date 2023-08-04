package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Administrador;
import entidad.Boleta;
import entidad.DetalleBoleta;
import entidad.Producto;
import mantenimiento.MySqlVentaDAO;

/**
 * Servlet implementation class ProdVentaServlet
 */
@WebServlet(name = "ProdVenta", description = "para el carro de compra", urlPatterns = { "/ProdVenta" })
public class ProdVentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdVentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Ingreso al servlet ventas");

		String accion = request.getParameter("btnMugi");
		System.out.println(accion);
		switch (accion) {
		case "Agregar":agregarcompra(request, response);break;
		case "elim":eliminarCompra(request, response);	break;
		case "fin":finalizarCompra(request, response);break;
	    
		case "adi":adicionar(request, response);break;
		case "dism":disminuir(request, response);break;
		default:

		}
	}

	private void disminuir(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ArrayList<DetalleBoleta> carro = (ArrayList<DetalleBoleta>) request.getSession().getAttribute("carro");
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double SubTotalVenta = (double) request.getSession().getAttribute("SubTotalVenta");

		// obtener el codigo del producto a eliminar-->pag canasta
		int idprod = Integer.parseInt(request.getParameter("txtcodcarro"));

		for (DetalleBoleta d : carro) {
			if (d.getCodigo_elc()==idprod) {
				//
				d.setCantidad(d.getCantidad()- 1);
				d.setImporte(d.getCantidad()* d.getPrecio());
				//aument los contadores y acumuladores
				SubTotalVenta -= d.getPrecio();
				cantArticulos -= 1;
				
				break;
			}

		}

		// volver a enviar a actualizar la informacion enviada
		request.getSession().setAttribute("carro", carro);
		request.getSession().setAttribute("cantArticulos", cantArticulos);
		request.getSession().setAttribute("SubTotalVenta", SubTotalVenta);

		response.sendRedirect("CarroElec.jsp");
		
	}

	private void adicionar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ArrayList<DetalleBoleta> carro = (ArrayList<DetalleBoleta>) request.getSession().getAttribute("carro");
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double SubTotalVenta = (double) request.getSession().getAttribute("SubTotalVenta");

		// obtener el codigo del producto a eliminar-->pag canasta
		int idprod = Integer.parseInt(request.getParameter("txtcodcarro"));

		for (DetalleBoleta d : carro) {
			if (d.getCodigo_elc()==idprod) {
				//
				d.setCantidad(d.getCantidad()+ 1);
				d.setImporte(d.getCantidad()* d.getPrecio());
				//aument los contadores y acumuladores
				SubTotalVenta += d.getPrecio();
				cantArticulos += 1;
				System.out.println("lo encontro"+d.getCodigo_elc());
				break;
			}
			System.out.println("sige dando vuleta"+d.getCodigo_elc());

		}

		// volver a enviar a actualizar la informacion enviada
		request.getSession().setAttribute("carro", carro);
		request.getSession().setAttribute("cantArticulos", cantArticulos);
		request.getSession().setAttribute("SubTotalVenta", SubTotalVenta);

		response.sendRedirect("CarroElec.jsp");
		
	}

	private void finalizarCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mensaje, url;

		// Obtener la informacion del usuario -->como se mando a nivel Sesion lo capturo
		Administrador a = (Administrador) request.getSession().getAttribute("usu");// se castea por es session

		// traer al carro a nivel de session para pasar variable
		ArrayList<DetalleBoleta> carro = (ArrayList<DetalleBoleta>) request.getSession().getAttribute("carro");
		double SubTotalVenta = (double) request.getSession().getAttribute("SubTotalVenta");
		//para que redireccione en caso de error
		if (a == null) {
			request.setAttribute("mensaje",
					"<div class='alert alert-danger' role='alert'> Debe estar logueado para finalizar la compra  </div>");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			return;
		}

		// Leer los datos a usar en la cabecera
		Boleta bo = new Boleta();
		bo.setNum_bol(obtenerNumeroBoleta()); // del metodo generado
		//bo.setFch_emi(); se asigna en la sentencia-----------------------
	    bo.setCod_usua(a.getCod_adm()); // del logueo
	    
	    System.out.println("codi usu "+a.getCod_adm());
        bo.setTotal(SubTotalVenta);
        
		MySqlVentaDAO gv = new MySqlVentaDAO();
		int ok = gv.insBolyDeta(bo, carro);

		if (ok == 0) {
			mensaje = "<div class='alert alert-danger' role='alert'> Error en la transaccion  </div>";
			url = "CarroElec.jsp";
		} else {
			mensaje = "<div class='alert alert-success' role='alert'> Transaccion OK</div>";
			url = "CarroElec.jsp";
			// limpiar variables---------------------
			request.getSession().setAttribute("carro", new ArrayList<DetalleBoleta>()); // para que se ponga vacio
			request.getSession().setAttribute("cantArticulos", 0);// dejar en 0
			request.getSession().setAttribute("SubTotalVenta", 0.0);// dejar en 0
			
		}

		request.setAttribute("mensaje", mensaje);
		// response.sendRedirect(url);
		request.getRequestDispatcher(url).forward(request, response);

		
	}
	private String obtenerNumeroBoleta() {
		// Llamar a la Gestion
		MySqlVentaDAO ve = new MySqlVentaDAO();

		return ve.gencodiBol();
	}


	private void eliminarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// obtener variables globales a nivel de session
		ArrayList<DetalleBoleta> carro = (ArrayList<DetalleBoleta>) request.getSession().getAttribute("carro");
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double SubTotalVenta = (double) request.getSession().getAttribute("SubTotalVenta");

		// obtener el codigo del producto a eliminar-->pag canasta
		int idprod = Integer.parseInt(request.getParameter("txtcodi"));
		// buscar el producto en el carro
		for (DetalleBoleta d : carro) {
			if (d.getCodigo_elc()==idprod) {
				SubTotalVenta -= d.getImporte();
				cantArticulos -= d.getCantidad();
				carro.remove(d);
				break;
			}

		}
		// volver a enviar a actualizar la informacion enviada a nivel de session
		request.getSession().setAttribute("carro", carro);
		request.getSession().setAttribute("cantArticulos", cantArticulos);
		request.getSession().setAttribute("SubTotalVenta", SubTotalVenta);

		response.sendRedirect("CarroElec.jsp");
		
	}

	private void agregarcompra(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//en el carro traemos el valor de la cantidad de compra
		int can = Integer.parseInt(request.getParameter("cantidad"));
		// obtener el atributo session de producto enviado en el servlet
		Producto p = (Producto) request.getSession().getAttribute("elc");
		
		ArrayList<DetalleBoleta> carro=null;
		//validar si existe el atributo de tipo sesión "carrito"
		if(request.getSession().getAttribute("carro")==null){//no existe el atributo
			//crear el arreglo data
			carro=new ArrayList<DetalleBoleta>();
			request.getSession().setAttribute("cantArticulos",0);
			request.getSession().setAttribute("SubTotalVenta", 0.0);
		}else {
			//existe el atributo data "recuperar y guardarlo en data"
			carro= (ArrayList<DetalleBoleta>) request.getSession().getAttribute("carro");
		}
			
		
		
		int cantArticulos = (int) request.getSession().getAttribute("cantArticulos");
		double SubTotalVenta = (double) request.getSession().getAttribute("SubTotalVenta");
        
		
		
		boolean encontro=false;
		//buscar si existe en el carro un producto con el codigo
		for (DetalleBoleta d : carro) {
			if (d.getCodigo_elc()==p.getCodigo()) {
				//
				d.setCantidad(d.getCantidad()+ can);
				d.setImporte(d.getCantidad()* d.getPrecio());
				//descontar los contadores y acumuladores
				SubTotalVenta += (d.getPrecio()* can);
				cantArticulos += can;
				encontro=true;
				break;
			}
			System.out.println("entro aqui buscar para aumenta");
		}
		//!encontro es nuevo en tonces
		if(encontro==false) {
			System.out.println("entro aqui nuevo");
	    //el atributo obtenido lo almaceno en detalle y lo agrego al array
			DetalleBoleta d = new DetalleBoleta();
		  //d.setNum_bol() lo asigno en la sentencia;
			d.setCodigo_elc(p.getCodigo()); // va en la BD
			d.setCantidad(can); // va en la BD
			d.setImporte(d.getCantidad()*p.getPrecio()); // va en la BD
			d.setNompro(p.getNombre());  //es para visualizacion
            d.setPrecio(p.getPrecio()); //es para visualizacion
			carro.add(d);
			
			//acumulamos la cantidad y el importe
			cantArticulos += d.getCantidad();
			SubTotalVenta += d.getImporte();
		}
		

		// volver a enviar a actualizar la informacion enviada
		request.getSession().setAttribute("carro", carro);
		request.getSession().setAttribute("cantArticulos", cantArticulos);
		request.getSession().setAttribute("SubTotalVenta", SubTotalVenta);

		response.sendRedirect("CarroElec.jsp");
		
		
	}

}
