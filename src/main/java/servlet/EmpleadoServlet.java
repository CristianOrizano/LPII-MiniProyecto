package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Empleado;
import mantenimiento.MySqlEmpleadoDAO;

/**
 * Servlet implementation class EmpleadoServlet
 */
@WebServlet(description = "crud", urlPatterns = { "/EmpleadoServlet" }) public class EmpleadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmpleadoServlet() {
		super();
		// TODO Auto-generated constructor stub
         
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String btn = request.getParameter("btnAccion");

		switch (btn) {
		case "reg":registrar(request, response);break;
		case "act":Actualizar(request, response);break;
		case "eli":Eliminar(request, response);break;
		case "list":listar(request, response);break;
		case "buscar":buscarE(request, response);break;
		default:
			
		}

	}

	private void buscarE(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cod= Integer.parseInt(request.getParameter("txtcodigo"));
		System.out.println("codigo "+cod);
		MySqlEmpleadoDAO embu = new MySqlEmpleadoDAO();
		Empleado emp = embu.busq(cod);
		request.setAttribute("em", emp);
		
		ArrayList<Empleado> empli = embu.lisall();
		request.setAttribute("empli", empli);
		
		request.getRequestDispatcher("CrudEmple.jsp").forward(request, response);
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MySqlEmpleadoDAO msrm = new MySqlEmpleadoDAO();
		ArrayList<Empleado> empli = msrm.lisall();
		
		request.setAttribute("empli", empli);
		request.getRequestDispatcher("CrudEmple.jsp").forward(request, response);

	}

	private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cod= Integer.parseInt(request.getParameter("txtcodigo"));
		System.out.println("codigo "+cod);
		
		MySqlEmpleadoDAO emd = new MySqlEmpleadoDAO();
		int sal = emd.delete(cod);
		if (sal > 0) {
			request.setAttribute("mensaje",
					"<div class=\"alert alert-primary\" role=\"alert\">\r\n" + " Empleado Eliminado!\r\n" + "</div>");
			ArrayList<Empleado> empli = emd.lisall();
			request.setAttribute("empli", empli);
		
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al registrar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}

		request.getRequestDispatcher("CrudEmple.jsp").forward(request, response);

	}

	private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cod= Integer.parseInt(request.getParameter("txtcodigo"));
		String nomb = request.getParameter("txtnom");
		String apelli = request.getParameter("txtape");
		int nro = Integer.parseInt(request.getParameter("txtnr"));
		double sueld = Double.parseDouble(request.getParameter("txtsuel"));

		Empleado em = new Empleado();
		em.setCodiEm(cod);
		em.setNombre(nomb);
		em.setApellido(apelli);
		em.setNumhi(nro);
		em.setSueldo(sueld);

		MySqlEmpleadoDAO emd = new MySqlEmpleadoDAO();
		int salida = emd.update(em);

		if (salida > 0) {

			request.setAttribute("mensaje",
					"<div class=\"alert alert-primary\" role=\"alert\">\r\n" + " Empleado Actualizado!\r\n" + "</div>");
			ArrayList<Empleado> empli = emd.lisall();
			request.setAttribute("empli", empli);
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al registrar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}

		request.getRequestDispatcher("CrudEmple.jsp").forward(request, response);


	}

	private void registrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String nomb = request.getParameter("txtnom");
		String apelli = request.getParameter("txtape");
		int nro = Integer.parseInt(request.getParameter("txtnr"));
		double sueld = Double.parseDouble(request.getParameter("txtsuel"));

		Empleado em = new Empleado();
		em.setNombre(nomb);
		em.setApellido(apelli);
		em.setNumhi(nro);
		em.setSueldo(sueld);

		MySqlEmpleadoDAO emd = new MySqlEmpleadoDAO();
		int salida = emd.insert(em);
		if (salida > 0) {
			request.setAttribute("mensaje","<div class=\"alert alert-info alert-dismissible fade show\" role=\"alert\">\r\n"
					+ "  Empleado Registrado .\r\n"
					+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
					+ "</div>");
			ArrayList<Empleado> empli = emd.lisall();
			request.setAttribute("empli", empli);
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al registrar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}
		request.getRequestDispatcher("CrudEmple.jsp").forward(request, response);

	}

}
