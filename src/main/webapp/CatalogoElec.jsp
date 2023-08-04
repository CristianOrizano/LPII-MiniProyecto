<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%--Importar mi libreria de etiquetas --%>
<%@ taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">


<!-- CSS del DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css">


<title>Crud electr</title>

<style type="text/css">
body {
	background: #C9FFBF;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FFAFBD, #C9FFBF);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FFAFBD, #C9FFBF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	
	
}

.formulario {
	padding: 5px;
	background: #abbaab; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ffffff, #abbaab);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ffffff, #abbaab);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: solid;
}

.formulario h3 {
	color: red;
	text-align: center;
	font-family: 'Bebas Neue', cursive;
}

.man {
	background: white;
	padding: 15px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg  navbar-dark bg-dark p-3">
		<div class="container-fluid">
			<a class="navbar-brand fs-5" href="Inicio.jsp">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
					<li class="nav-item"><a class="nav-link active fs-5"
						aria-current="page" href="#">Inicio</a></li>
					<li class="nav-item"><a class="nav-link fs-5" href="ProducServlet?btnAccion=catalago"
						style="color: white">Catalogo</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle fs-5" style="color: white"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Mantenimiento
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item fs-5"
								href="EmpleadoServlet?btnAccion=list">Empleado</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item fs-5"
								href="AdminServlet?btnMUGI=list">Administrador</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item fs-5" href="CrudElec.jsp">Producto</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- form -->
	<div class="container">
	      <form action="ProducServlet" method="post">
	       <div class="row">
		      <div class="col-sm-12 col-md-6">
		      <h3>Listado catalogo</h3>
		        <select class="form-select" id="validationDefault04" required name="cboCate" aria-label="Default select example">
									<option  value="">Seleccione</option>
									<!-- mi etiqueta pers -->
									<tools:cboCategPa/>
								</select>
		      </div>
		    </div>
		    <br>
	          <button type="submit" class="btn btn-primary" name="btnAccion" value="filtroCat">Consultar</button>
	          </form>
	          
		<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4 mt-5"> 
		    <c:forEach items="${listpd }" var="e">
			<div class="col">
				<div class="card ">
					<img src="img/producto/${e.getCodigo() }.PNG" class="card-img-top"
						onerror="this.src='img/producto/elec.jpg'" />
					<div class="card-body bg-dark">					
							<h5 class="card-title text-center text-white">${e.getNombre() }</h5>
							<h5 class="card-text text-center text-white">
								<fmt:setLocale value="es_PE" />
								<fmt:formatNumber value="${e.getPrecio()}" type="currency" />
							</h5>
							<h5 class="card-text text-center text-white">
								Marca:
								${e.getMarca()}</h5>
							<br>
					
						<form action="ProducServlet" method="post">
							<input name="txtcodigo" value="${e.getCodigo() }" type="hidden">
							<div class="text-center">
								<button type="submit" name="btnAccion" value="enviar"
									class="btn btn-success">Agregar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			 </c:forEach>
		</div>



	</div>














	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<!-- js de DataTable -->
<script
	src="https:cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
</script>

</html>