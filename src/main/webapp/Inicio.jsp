<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>pagina boo ori</title>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
.en1 {
	width: 350px;
	height: 600px;
	display: inline-block;
	margin: 30px;
}

.en2 {
	width: 350px;
	height: 600px;
	display: inline-block;
}

.en3 {
	width: 350px;
	height: 600px;
	display: inline-block;
	margin: 30px;
}

.ce {
	text-align: center;
	background: #088A85;
	color: white;
	padding: 15px;
	margin-bottom: 0px;
	font-size: 20px;
	font-family: 'Roboto Condensed', sans-serif;
}

.p {
	margin: 8px;
	text-align: left;
}

.sub {
	text-decoration: none;
	font-size: 25px;
	color: red;
}

.li {
	text-decoration: none;
	color: white;
	background: black;
	padding: 5px;
	border-radius: 20px;
	text-align: center;
}

.lis {
	background: yellow;
	padding: 10px;
	color: black;
	text-decoration: none;
	font-size: 17px;
	border: solid;
}

.con2 {
	background: pink;
	width: 255px;
	float: left;
}

body {
	background: #abbaab; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #ffffff, #abbaab);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #ffffff, #abbaab);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
</style>
</head>
<body>

	<!-- nabar-->
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
					<li class="nav-item"><a class="nav-link fs-5"
						href="ProducServlet?btnAccion=catalago" style="color: white">Catalogo</a></li>
					<li class="nav-item"><a class="nav-link fs-5"
						href="CarroElec.jsp" style="color: white">carro</a></li>
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
						
							<li class="nav-item"><a class="nav-link fs-5"
						href="AdminServlet" style="color: white">Cerrar session</a></li>

				</ul>
			</div>
		</div>
	</nav>



	<!-- ---->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imagen/9.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="imagen/9.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="imagen/9.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container">

		<div class="row align-items-center justify-content-center mt-5 py-3">

			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-5 ">
				<h3 style="color: red">Desarrollo de software</h3>
				<h4 style="color: blue">La informática no debe ser un problema,
					debe ser parte de la solución.</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum. lorem</p>
				<p>
					<a class="lis" href="##"> ver datalle</a>
				</p>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-4 ">
				<img src="imagen/sof.jpg" class="img-fluid" style="width: 410px">
			</div>

		</div>

		<div class="row justify-content-center py-3">

			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 p-3 ">
				<div class="p-3 ">
					<h4 class="ce">Redes y Soporte técnico</h4>
					<img src="imagen\sol.jpg" class="img-fluid" width="350px"
						height="200px">
					<h3 class="sub">
						<a class="sub" href="##">Planes de soporte técnico
							empresarial</a>
					</h3>
					<p class="p">En la línea de Redes y Soporte técnico tenemos un
						portafolio orientado a brindar soluciones de infraestructura
						tecnológica en 3 grupos de acción para el bienestar familiar de
						todods djfhjd</p>
					<center>
						<a class="li"
							href="https://html-color-codes.info/codigos-de-colores-hexadecimales/">Leer
							más</a>
					</center>
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 p-3">
				<div class="p-3 ">
					<h4 class="ce">Redes y Soporte técnico</h4>
					<img src="imagen\sol.jpg" class="img-fluid" width="500px"
						height="200px">
					<h3 class="sub">
						<a class="sub" href="##">Planes de soporte técnico
							empresarial</a>
					</h3>
					<p class="p">En la línea de Redes y Soporte técnico tenemos un
						portafolio orientado a brindar soluciones de infraestructura
						tecnológica en 3 grupos de acción para el bienestar familiar de
						todods djfhjd</p>
					<center>
						<a class="li"
							href="https://html-color-codes.info/codigos-de-colores-hexadecimales/">Leer
							más</a>
					</center>
				</div>
			</div>

			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 p-3">
				<div class="p-3">
					<h4 class="ce">Redes y Soporte técnico</h4>
					<img src="imagen\sol.jpg" class="img-fluid" width="500px"
						height="200px">
					<h3 class="sub">
						<a class="sub" href="##">Planes de soporte técnico
							empresarial</a>
					</h3>
					<p class="p">En la línea de Redes y Soporte técnico tenemos un
						portafolio orientado a brindar soluciones de infraestructura
						tecnológica en 3 grupos de acción para el bienestar familiar de
						todods djfhj</p>
					<center>
						<a class="li"
							href="https://html-color-codes.info/codigos-de-colores-hexadecimales/">Leer
							más</a>
					</center>
				</div>
			</div>

		</div>
	</div>



	<section style="background: #81F7F3">
		<div class="container ">

			<div class="row">
				<div class="col-md-12 col-md-9">
					<h3 class="text-center p-3">Tenemos presente que somos el
						mejor servicio recuerdalo.</h3>
				</div>
			</div>
			<div class="row justify-content-center ">
				<div class="col-sm-12 col-md-6 col-lg-5 col-xl-3 p-4">
					<div>
						<img src="imagen/pag1.jpg" class="img-fluid"
							style="height: 163px; width: 500px; border-radius: 50px">
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-5 col-xl-3 p-4">
					<div s>
						<img src="imagen/pag4.jpg" class="img-fluid"
							style="height: 163px; width: 500px; border-radius: 50px">
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-5 col-xl-3 p-4">
					<div>
						<img src="imagen/pag1.jpg" class="img-fluid"
							style="height: 163px; width: 500px; border-radius: 50px">
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-5 col-xl-3 p-4">
					<div>
						<img src="imagen/pag1.jpg" class="img-fluid"
							style="height: 163px; width: 500px; border-radius: 50px">
					</div>
				</div>

			</div>

		</div>
	</section>


	<div class="container ">
		<div class="row justify-content-center pt-4">
			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
				<div style="background: #F7BE81;">
					<img src="imagen/ser1.png" class="img-fluid">
					<h3 style="color: red; text-align: center;">Desarrollo de
						Software en la Nube</h3>
					<p style="padding: 13px; text-align: left;">Lorem ipsum dolor
						sit amet, consectetur adipisicing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim
						veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
						ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
						voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
						officia deserunt mollit anim id est laborum.</p>
				</div>

			</div>
			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
				<div style="background: #F7BE81;">
					<img src="imagen/ser2.png" class="img-fluid">
					<h3 style="color: red; text-align: center;">Desarrollo de
						Software en la Nube</h3>
					<p style="padding: 13px; text-align: left;">Lorem ipsum dolor
						sit amet, consectetur adipisicing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim
						veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
						ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
						voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
						officia deserunt mollit anim id est laborum.</p>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
				<div style="background: #F7BE81;">
					<img src="imagen/ser3.png" class="img-fluid">
					<h3 style="color: red; text-align: center;">Desarrollo de
						Software en la Nube</h3>
					<p style="padding: 13px; text-align: left;">Lorem ipsum dolor
						sit amet, consectetur adipisicing elit, sed do eiusmod tempor
						incididunt ut labore et dolore magna aliqua. Ut enim ad minim
						veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
						ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
						voluptate velit esse cillum dolore eu fugiat nulla pariatur.
						Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
						officia deserunt mollit anim id est laborum.</p>
				</div>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="col-sm-12 col-md-9  ">
				<h3 style="text-align: center;">Profesionales especialistas en
					distintas áreas de informática y telecomunicaciones.</h3>
				<p class="px-5 ">El equipo de profesionales que conforman
					nuestra empresa destaca por su experiencia real en la utilización y
					aprovech de procesos en proyectos de TI. Index Net domina los
					distintos marcos de referencia y tiene profesionales con
					conocimientos y experiencia para integrarlos de acuerdo a las
					necesidades de los clientes.</p>
			</div>
		</div>

		<div class="row justify-content-center mt-4 ">
			<div class="col-sm-12 col-md-6 col-lg-5   px-4">
				<div class="row  align-items-center  justify-content-center">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6 p-0">
						<img src="imagen/sol.jpg" class="img-fluid">
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-6 "
						style="background: yellow">
						<h3>hol ba</h3>
						<p>Consultoría como un servicio integral y personalizado,
							empleando a disposición del cliente programas, planificación y
							documentación sus necesidades</p>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-5  px-4">

				<div class="row  align-items-center  justify-content-center">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6 p-0">
						<img src="imagen/sol.jpg" class="img-fluid">
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6"
						style="background: yellow">
						<h3>hol bab</h3>
						<p>Consultoría como un servicio integral y personalizado,
							empleando a disposición del cliente programas, planificación y
							documentación sus necesidades</p>
					</div>
				</div>

			</div>
		</div>

		<div class="row justify-content-center mt-4 ">
			<div class="col-sm-12 col-md-6 col-lg-5   px-4">
				<div class="row  align-items-center  justify-content-center">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6 p-0">
						<img src="imagen/sol.jpg" class="img-fluid">
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6"
						style="background: yellow">
						<h3>hol ba</h3>
						<p>Consultoría como un servicio integral y personalizado,
							empleando a disposición del cliente programas, planificación y
							documentación sus necesidades</p>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-5 px-4">

				<div class="row  align-items-center  justify-content-center">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6 p-0">
						<img src="imagen/sol.jpg" class="img-fluid">
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  col-xxl-6"
						style="background: yellow">
						<h3>hol ba</h3>
						<p>Consultoría como un servicio integral y personalizado,
							empleando a disposición del cliente programas, planificación y
							documentación sus necesidades</p>
					</div>
				</div>

			</div>
		</div>

	</div>

	<!--footer -->
	<section style="background: black; height: 300px">
		<div class="container">
			<h3>hola</h3>
		</div>
	</section>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	${mensaje}
</script>
</html>