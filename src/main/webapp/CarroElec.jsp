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
	     
	     <%--Validar si el carro tiene contenido --%>
				<c:if test="${carro.size() == 0 || carro.size() == null }">
					<h1>Carrito de compra</h1>
					<center>
						<img alt="" src="img/empty_box.png">
						<p>Su carrito de compras está vacío. Haga click en catalogo
							para buscar productos.</p>
					</center>
				</c:if>
	     
	     	<%--Tabla con el contenido del carro --%>
				<c:if test="${carro.size() >0}">
		<div class="row">
		  <div class="col-sm-12 col-md-9" style="background: white">
		       <div>
		           <div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Producto</th>
								<th></th>
								<th>Precio</th>
								<th></th>
								<th>Cantidad</th>
								<th></th>
								<th>Subtotal</th>
								<th>${elc.getStock()}</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${carro}" var="elec">
							<tr>
									<th><img class="img-fluid"
										src="img/producto/${elec.getCodigo_elc()}.PNG"
										onerror="this.src='img/producto/elec.jpg'" width="150px"
										height="150px"></th>
									<th>${elec.getNompro() }</th>
									<th><fmt:setLocale value="es_PE" /> <fmt:formatNumber
											value="${elec.getPrecio() }" type="currency" /></th>
											
									<th>
									 <c:if test="${elec.getCantidad() == 1 }">
									  <button type="submit"	class="btn ">-</button></c:if>
									  
									 <c:if test="${elec.getCantidad() >1 }">			
										<form action="ProdVenta" method="post">
									  <input name="txtcodcarro" value="${elec.getCodigo_elc() }" type="hidden">
									  <button type="submit" name="btnMugi" value="dism" class="btn ">-</button> </form></c:if>
													
									</th>	
													
									<th style="text-align: center;">${elec.getCantidad()}</th>
									
									<th> 
									   <c:if test="${elec.getCantidad() < elc.getStock() }">
										<form action="ProdVenta" method="post">
									  <input name="txtcodcarro" value="${elec.getCodigo_elc() }" type="hidden">
									<button type="submit" name="btnMugi" value="adi" class="btn ">+</button></form>
									</c:if>
									
									 <c:if test="${elec.getCantidad() >= elc.getStock() }">
									<button type="submit" name="btnMugi" value="adi" class="btn ">+</button></form>
									</c:if>
									
									
									</th>
									
									<th><fmt:setLocale value="es_PE" /> <fmt:formatNumber
											value="${elec.getImporte() }" type="currency" /></th>
									<th><form action="ProdVenta" method="post">
											<input name="txtcodi" value="${elec.getCodigo_elc() }" type="hidden">
											<button type="submit" name="btnMugi" value="elim"
												class="btn btn-link">
												<img alt="" src="img/tacho.png">
											</button>
										</form></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
		  </div>
		   <div class="col-sm-12 col-md-3" style="background: white;height: 400px">
		     <div style="background: #F2F2F2;padding: 10px">
		      <h3>Resumen </h3>
		      <hr>
					<table class="table">
					
							<tr>
								<th><h6>cantidad Articulos:</h6></th>
								
								<th><h5>${cantArticulos}</h5></th>
							</tr>
						
							<tr>
								<th>
									<h6>Sub total :</h6>
								</th>

								<td><fmt:setLocale value="es_PE" />
									<fmt:formatNumber value="${SubTotalVenta }" type="currency" /></td>
							</tr>
							<tr>
								<th><h4>Total</h4></th>

								<th><h5>
										<fmt:setLocale value="es_PE" />
										<fmt:formatNumber value="${SubTotalVenta }" type="currency" />
									</h5></th>
							</tr>
						
					</table>
					<br> <br> 
					<form action="ProdVenta" method="post">
		            <div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary" name="btnMugi"
							value="fin">Procesar compra</button>
					</div>
					</form>
						
		      </div>
		  </div>
		</div>
		 </c:if>
       ${mensaje }
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