<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%--mejorar mi listado core (variables,condicionales,repetitivo)
 prefix(el alias)--%>
 
 <%--Importar las librerias standar de etiqueta de Java 
    uri="nombre de la libreria a utilizar" - OJO hay que instalar
	core= uso de variablesm condicionales, repetitivas
	fmt= formatos de fecha, numerico, etc
    prefix= "alias de la libreria"	
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">



<!-- CSS del DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css">


<title>Insert title here</title>

<style type="text/css">
body {
	background: #12c2e9; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #f64f59, #c471ed, #12c2e9);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #f64f59, #c471ed, #12c2e9);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.formulario {
	padding: 15px;
	background: #abbaab; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ffffff, #abbaab);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ffffff, #abbaab);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: solid;
	box-shadow: yellow 10px  5px 35px ;
}

.formulario h3 {
	color: red;
	text-align: center;
	font-family: 'Bebas Neue', cursive;
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
		<div class="row align-items-center mt-5">

			<div class="col-sm-12 col-md-6 col-lg-5 p-3"
				style="background: ">
				<div class="formulario">
					<br>
					<br>
					<br>
					<br>
					<h3 class="text-center">Registro empleado</h3>
					<form method="post" action="EmpleadoServlet">
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="formGroupExampleInput2" class="form-label">
									Codigo </label> <input type="text" class="form-control"
									name="txtcodigo" value="${em.getCodiEm()}"
									id="formGroupExampleInput2" placeholder="Codigo Empleado">
							</div>

						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">Nombre
							</label> <input type="text" class="form-control" name="txtnom"
								value="${em.getNombre()}" id="validationDefault01" required
								id="formGroupExampleInput" placeholder="Ingrese su nombre">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Apellido
							</label> <input type="text" class="form-control" name="txtape"
								value="${em.getApellido()}" id="validationDefault01" required
								id="formGroupExampleInput2" placeholder="Ingrese su Apellido">
						</div>
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="formGroupExampleInput2" class="form-label">Nro
									Hijos </label> <input type="number" name="txtnr" min=0
									value="${em.getNumhi()}" class="form-control"
									id="validationDefault01" required id="formGroupExampleInput2"
									placeholder="Ingrese Nro Hijos">
							</div>
							<div class="col-md-6">
								<label for="formGroupExampleInput2" class="form-label">Sueldo
								</label> <input type="number" min=1 step="0.01" name="txtsuel"
									class="form-control" value="${em.getSueldo()}"
									id="formGroupExampleInput2" placeholder="Ingrese sueldo">
							</div>
						</div>
						<button type="submit" class="btn btn-primary" name="btnAccion"
							value="reg">Registrar</button>
						<button type="submit" class="btn btn-warning" name="btnAccion"
							value="act">Actualizar</button>
						<button type="submit" class="btn btn-danger" name="btnAccion"
							value="eli">Eliminar</button>
						<button type="submit" class="btn btn-success" name="btnAccion"
							value="list">Listar</button>
						<br>
						<br>
						<br>
						<br>
					</form>
					${mensaje }
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-7 "
				style="">
				<div style="background:white; padding: 8px">
					<h3 class="text-center" style="color: red;">Registro de
						Empleado</h3>
					<div class="table-responsive">
						<table class="table  table-striped  table-hover" id="myTable" >
							<thead>
								<tr class="table-dark">
									<th scope="col">Codigo</th>
									<th scope="col">Nombre</th>
									<th scope="col">Apellido</th>
									<th scope="col">Nro hijos</th>
									<th scope="col">Sueldo</th>
									<th scope="col">b</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${empli}" var="pr">
									<tr class="grilla_campo">
										<th>${pr.getCodiEm()}</th>
										<th>${pr.getNombre()}</th>
										<th>${pr.getApellido()}</th>
										<th>${pr.getNumhi()}</th>
										<th>${pr.getSueldo()}</th>
										<td><form action="EmpleadoServlet" method="post">
												<input type="hidden" name="txtcodigo"
													value="${pr.getCodiEm()}">
												<button class="btn btn-link" type="submit" name="btnAccion"
													value="buscar">
													<img alt="" src="img/editar.png"
														onmouseover="src='img/editar2.png'"
														onmouseout="src='img/editar.png'">
												</button>
											</form></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>

			</div>

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