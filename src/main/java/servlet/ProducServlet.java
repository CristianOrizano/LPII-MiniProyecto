package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Empleado;
import entidad.Producto;
import mantenimiento.MySqlEmpleadoDAO;
import mantenimiento.MySqlProdcutoDAO;

/**
 * Servlet implementation class ProducServlet
 */
@WebServlet("/ProducServlet")
public class ProducServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProducServlet() {
    	
       
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("btnAccion");

		System.out.println("Accion: " + accion + "\n");

		switch (accion) {
		case "reg":registrar(request, response);break;
		case "act":actualizar(request, response);break;
		case "eli":	eliminar(request, response);break;
		case "lst":listar(request, response);break;
		case "bus": buscar(request, response);break;
		case "catalago": liscatalogo(request, response);break;
		case "filtroCat": catalogoFil(request, response);break;
		case "enviar": enviarELecAcompra(request, response);break;
		

		default:
	}

}

	private void enviarELecAcompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cod= Integer.parseInt(request.getParameter("txtcodigo"));
		System.out.println("codigo "+cod);
		
		MySqlProdcutoDAO embu = new MySqlProdcutoDAO();
		Producto pr = embu.buscarca(cod);
		request.getSession().setAttribute("elc", pr);
		
		
		request.getRequestDispatcher("CompraElec.jsp").forward(request, response);
		
		
	}

	private void catalogoFil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ide_cat = Integer.parseInt(request.getParameter("cboCate"));
		MySqlProdcutoDAO pro = new MySqlProdcutoDAO();
		ArrayList<Producto> lispro = pro.consCate(ide_cat);
		
		request.setAttribute("listpd", lispro);
		request.getRequestDispatcher("CatalogoElec.jsp").forward(request, response);
	}

	private void liscatalogo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MySqlProdcutoDAO pro = new MySqlProdcutoDAO();
		ArrayList<Producto> lispro = pro.lisall();
		
		request.setAttribute("listpd", lispro);
		request.getRequestDispatcher("CatalogoElec.jsp").forward(request, response);
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cod= Integer.parseInt(request.getParameter("txtcodigo"));
		System.out.println("codigo "+cod);
		
		MySqlProdcutoDAO embu = new MySqlProdcutoDAO();
		Producto pr = embu.buscar(cod);
		request.setAttribute("pr", pr);
		
		
		request.getRequestDispatcher("CrudElec.jsp").forward(request, response);
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MySqlProdcutoDAO pro = new MySqlProdcutoDAO();
		ArrayList<Producto> lispro = pro.lisall();
		
		request.setAttribute("listpd", lispro);
		request.getRequestDispatcher("ListadoElec.jsp").forward(request, response);
		
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int codigo= Integer.parseInt(request.getParameter("txtcodigo"));
	

		MySqlProdcutoDAO ge = new MySqlProdcutoDAO();
		int ok = ge.delete(codigo);

		if (ok == 0) {
			request.setAttribute("mensaje",
					"<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al eliminar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
			
			
		}

		else {
			request.setAttribute("mensaje",
					"<div class='alert alert-success alert-dismissible fade show' role='alert'>"
							+ "  <strong>Producto eliminado</strong>"
							+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
							+ "</div>");
		}

		request.getRequestDispatcher("CrudElec.jsp").forward(request, response);
		
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int codigo= Integer.parseInt(request.getParameter("txtcodigo"));
		int ide_cat = Integer.parseInt(request.getParameter("cboCate"));
		String nombre = request.getParameter("txtNombre");
		int stock = Integer.parseInt(request.getParameter("txtStock"));
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		String marca = request.getParameter("txtmarca");
		

		Producto pr=new Producto();
		pr.setCodigo(codigo);
		pr.setIde_cat(ide_cat);
		pr.setNombre(nombre);
		pr.setStock(stock);
		pr.setPrecio(precio);
		pr.setMarca(marca);

		MySqlProdcutoDAO ge = new MySqlProdcutoDAO();
		int ok = ge.update(pr);

		if (ok == 0) {
			request.setAttribute("mensaje",
					"<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al Actualizar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
			
			
		}

		else {
			request.setAttribute("mensaje",
					"<div class='alert alert-success alert-dismissible fade show' role='alert'>"
							+ "  <strong>Producto Actualizado</strong>"
							+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
							+ "</div>");
		}

		request.getRequestDispatcher("CrudElec.jsp").forward(request, response);
		
	}
	//codigo generado de producto
	public int codiPro() {
		MySqlProdcutoDAO pro = new MySqlProdcutoDAO();
		int cod = pro.gencodi();
		return cod;
	}
	

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int ide_cat = Integer.parseInt(request.getParameter("cboCate"));
		String nombre = request.getParameter("txtNombre");
		int stock = Integer.parseInt(request.getParameter("txtStock"));
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		String marca = request.getParameter("txtmarca");
		

		Producto pr=new Producto();
		pr.setCodigo(codiPro());
		pr.setIde_cat(ide_cat);
		pr.setNombre(nombre);
		pr.setStock(stock);
		pr.setPrecio(precio);
		pr.setMarca(marca);

		MySqlProdcutoDAO ge = new MySqlProdcutoDAO();
		int ok = ge.insert(pr);

		if (ok == 0) {
			request.setAttribute("mensaje",
					"<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al registrar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
			
			
		}

		else {
			request.setAttribute("mensaje",
					"<div class='alert alert-success alert-dismissible fade show' role='alert'>"
							+ "  <strong>Producto registrado</strong>"
							+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
							+ "</div>");
		}

		request.getRequestDispatcher("CrudElec.jsp").forward(request, response);

		
	}
}