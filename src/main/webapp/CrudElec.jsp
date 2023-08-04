<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%--Importar mi libreria de etiquetas --%>
<%@ taglib uri="/WEB-INF/libreria.tld" prefix="tools" %>

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
	background: #525252;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #3d72b4, #525252);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #3d72b4, #525252); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	
	
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
.man{
 background:white;
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
	<div class="container" >
		<div class="row  justify-content-center" style="margin-top: 100px" >
			<div class="col-sm-12 col-md-9 col-lg-8 p-2" style="background: orange">
			 <div style="background: white;padding: 16px">
			 <h2 class="text-center" style="color: red">Mantenimiento Electrodomesticos</h2>
			  <form action="ProducServlet" method="post" >
						<div class="row mb-3 ">
							<div class="col-sm-12 col-md-6">
								<label for="validationCustom02" class="form-label">Codigo</label>
								<input type="text" class="form-control" placeholder="Codigo"
								name="txtcodigo" value="${pr.getCodigo()}"	aria-label="First name">
							</div>
							<div class="col-sm-12 col-md-6">
								<label for="exampleInputEmail1" class="form-label">Categoria
								</label> <select class="form-select" id="validationDefault04" required name="cboCate" aria-label="Default select example">
									<option  value="">Seleccione</option>
									<!-- mi etiqueta pers -->
									<tools:cboCategPa valor="${pr.getIde_cat()}"/>
								</select>
								
							</div>
							
						</div>
						<div class="row mb-3 ">
							<div class="col-sm-12 col-md-12">
								<label for="validationCustom02" class="form-label">Nombre</label>
								<input type="text" class="form-control" placeholder="Ingrese producto" id="validationDefault02"
								name="txtNombre" value="${pr.getNombre()}"	aria-label="First name" required>
							</div>
							
							
						</div>
						<div class="row mb-3 ">
							<div class="col-sm-12 col-md-6">
								<label for="validationCustom02" class="form-label">Precio</label>
								<input type="number" step="0.01" min=1 class="form-control" placeholder="Ingrese precio"
								name="txtPrecio" value="${pr.getPrecio()}"	aria-label="First name" required>
							</div>
							<div class="col-sm-12 col-md-6">
								<label  for="validationTooltip03" class="form-label">Stock</label>
								<input type="number" min=1 class="form-control" id="validationDefault02"
								name="txtStock" value="${pr.getStock()}"	placeholder="Ingrese stock" required>
							</div>
						</div>
						<div class="row mb-3 ">
							<div class="col-sm-12 col-md-6">
								<label for="validationCustom02" class="form-label">Marca</label>
								<input type="text" class="form-control" placeholder="Ingrese marca"
								name="txtmarca" value="${pr.getMarca()}"	aria-label="First name" required>
							</div>
						</div>
					    <br><br>
						<button type="submit" name="btnAccion" value="reg" class="btn btn-primary">Registrar</button>
						<button type="submit" name="btnAccion" value="act" class="btn btn-warning">Actualizar</button>
						<button type="submit" name="btnAccion" value="eli" class="btn btn-danger">Eliminar</button>
						<a class="btn btn-primary" href="ProducServlet?btnAccion=lst">Listar</a>
                         <br>
					</form>
					${mensaje} 
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