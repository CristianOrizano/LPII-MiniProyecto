package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Administrador;
import entidad.Empleado;
import mantenimiento.MySqlAdministradorDAO;
import mantenimiento.MySqlEmpleadoDAO;

/**
 * Servlet implementation class AdministradorServlet
 */
@WebServlet(name = "AdminServlet", urlPatterns = { "/AdminServlet" })
public class AdministradorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministradorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("btnMUGI");
		
		// si accion es null accion es cerrar, como no
		// existe lo mada por default
		accion = (accion == null) ? "cerrar" : accion;
				
		switch(accion) {
		case "reg":registrar(request, response);break;
		case "act":Actualizar(request, response);break;
		case "eli":Eliminar(request, response);break;
		case "list":listar(request, response);break;
		case "buscar":buscarE(request, response);break;
		case "login":InLogin(request,response);break;
		default:
			
			//cerrar la secion
			//System.out.println("Cerrando la sesion: " +request.getSession().getId());
			//limpiando la secion
			request.getSession().invalidate();
			response.sendRedirect("Login.jsp");
		
		}
		
		
	
	}

	private void buscarE(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cod= request.getParameter("txtcodigo");
		System.out.println("codigo "+cod);
		MySqlAdministradorDAO admi = new MySqlAdministradorDAO();
		Administrador admns = admi.buscar(cod);
		System.out.println("codigo "+admns.getCod_ciu());
		request.setAttribute("adm", admns);
		
		ArrayList<Administrador> admis = admi.lisall();
		request.setAttribute("list", admis);
		
		request.getRequestDispatcher("CrudAdmin.jsp").forward(request, response);
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MySqlAdministradorDAO adm= new MySqlAdministradorDAO();
		ArrayList<Administrador> amis= adm.lisall();
		
		request.setAttribute("list", amis);
		request.getRequestDispatcher("CrudAdmin.jsp").forward(request, response);
			
	}

	private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cod = request.getParameter("txtcodigo");
		

		MySqlAdministradorDAO adm = new MySqlAdministradorDAO();
		int salida = adm.delete(cod);
		
		if (salida > 0) {
			request.setAttribute("mensaje","<div class=\"alert alert-info alert-dismissible fade show\" role=\"alert\">\r\n"
					+ "  Administ eliminado .\r\n"
					+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
					+ "</div>");
			ArrayList<Administrador> admis = adm.lisall();
			request.setAttribute("list", admis);
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al eliminar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}
		request.getRequestDispatcher("CrudAdmin.jsp").forward(request, response);
		
	}

	private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cod =request.getParameter("txtcodigo");
		String nom = request.getParameter("txtnombre");
		String ape = request.getParameter("txtapellido");
		String dir = request.getParameter("txtdirec");
		int tel = Integer.parseInt(request.getParameter("txttelefono"));
		String sexo = request.getParameter("txtsexo");
		String fec = request.getParameter("txtfecha");
		String ciu = request.getParameter("txtciudad");

		Administrador ad = new Administrador();
		ad.setCod_adm(cod);
		ad.setNombre(nom);
		ad.setApellido(ape);
		ad.setDireccion(dir);
		ad.setTelefono(tel);
		ad.setSexo(sexo);
		ad.setFecha_nac(fec);
		ad.setCod_ciu(ciu);
		
		MySqlAdministradorDAO adm = new MySqlAdministradorDAO();
		int salida = adm.update(ad);
		
		if (salida > 0) {
			request.setAttribute("mensaje","<div class=\"alert alert-info alert-dismissible fade show\" role=\"alert\">\r\n"
					+ "  Administ Actualizado .\r\n"
					+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
					+ "</div>");
			ArrayList<Administrador> admis = adm.lisall();
			request.setAttribute("list", admis);
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al Actualizado</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}
		request.getRequestDispatcher("CrudAdmin.jsp").forward(request, response);
	}
	//metodo generar codigo admini
	public String codiAdm() {
		MySqlAdministradorDAO ad= new MySqlAdministradorDAO();
		String cod= ad.gencodi();
		return cod;
		
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cod = codiAdm();
		System.out.println("cod gen "+codiAdm());
		String nom = request.getParameter("txtnombre");
		String ape = request.getParameter("txtapellido");
		String dir = request.getParameter("txtdirec");
		int tel = Integer.parseInt(request.getParameter("txttelefono"));
		String sexo = request.getParameter("txtsexo");
		String fec = request.getParameter("txtfecha");
		String ciu = request.getParameter("txtciudad");

		System.out.println("fecha"+fec);
		 
		Administrador ad = new Administrador();
		ad.setCod_adm(cod);
		ad.setNombre(nom);
		ad.setApellido(ape);
		ad.setDireccion(dir);
		ad.setTelefono(tel);
		ad.setSexo(sexo);
		ad.setFecha_nac(fec);
		ad.setCod_ciu(ciu);
		
		MySqlAdministradorDAO adm = new MySqlAdministradorDAO();
		int salida = adm.insert(ad);
		
		if (salida > 0) {
			request.setAttribute("mensaje","<div class=\"alert alert-info alert-dismissible fade show\" role=\"alert\">\r\n"
					+ "  Adminis Registrado .\r\n"
					+ "  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n"
					+ "</div>");
			ArrayList<Administrador> admis = adm.lisall();
			request.setAttribute("list", admis);
		} else {
			request.setAttribute("mensaje", "<div class='alert alert-danger alert-dismissible fade show' role='alert'>"
					+ "  <strong>Error al registrar</strong> Revisa que los campos sean correctos"
					+ "  <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
					+ "</div>");
		}
		request.getRequestDispatcher("CrudAdmin.jsp").forward(request, response);
		
	}

	private void InLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usu= request.getParameter("txtUsuario");
		String con= request.getParameter("txtContraseña");
		
		MySqlAdministradorDAO admi= new MySqlAdministradorDAO();
		Administrador adm= admi.login(usu, con);
		if(adm != null ) {
			request.getSession().setAttribute("usu", adm);
			request.setAttribute("mensaje","swal(\"Bienvenido!\", \"Al sistema\", \"success\");");
			
			request.getRequestDispatcher("Inicio.jsp").forward(request, response);
		}else {
			
			request.setAttribute("mensaje","swal ( \"Oops\" ,  \"Usuario incorrecto\" ,  \"error\" )");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
			
	}

}
