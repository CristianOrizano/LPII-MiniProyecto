<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
		<!-- CSS del DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css">


 
 <style type="text/css">


		.help-block {
			color: red;
		}

	
		.form-group.has-error .form-control {
			border: 1px solid red;
			box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
		}


  
body {
	background: #43C6AC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #191654, #43C6AC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #191654, #43C6AC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	
	

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



	<!-- form -->
	<div class="container" >
		<div class="row  justify-content-center mt-3" >
			<div class="col-sm-12 col-md-10 col-lg-11 " style="background: #F7BE81;padding: 10px;">
				<div class="man">
					<h2 class="text-center" style="color:red ">Mantenimiento Administrador</h2>
					<form   action="AdminServlet" id="formDocente" method="post" class="form-horizontal" >
						<div class="row mb-3 ">
							<div class="col-sm-12 col-md-4">
								<label for="validationCustom02" class="form-label">Codigo</label>
								<input type="text" class="form-control" placeholder=""
								name="txtcodigo" value="${adm.getCod_adm()}"	aria-label="First name">
							</div>
							<div class="form-group col-sm-12 col-md-4">
								<label  for="validationTooltip03" class="form-label">Nombre</label>
								 <input type="text" class="form-control" id="idDescripcion" name="txtnombre" />
                               
								
							</div>
							<div class="form-group col-sm-12 col-md-4">
								<label for="exampleInputEmail1" class="form-label">Apellido</label>
								<input type="text" class="form-control" id="validationDefault02" required
								name="txtapellido" value="${adm.getApellido()}"	placeholder="Ingrese Nombre" aria-label="First name">
							</div>
						</div>
						<div class="row mb-3 ">
							<div class="form-group col-sm-12 col-md-4">
								<label for="exampleInputEmail1" class="form-label">Direccion</label>
								<input type="text" class="form-control" id="validationDefault02" required
								name="txtdirec" value="${adm.getDireccion()}"	placeholder="Ingrese Direccion" aria-label="First name">
							</div>
							<div class="form-group col-sm-12 col-md-4">
								<label for="exampleInputEmail1" class="form-label">Telefono</label>
								<input type="number" min=1 class="form-control" id="validationDefault02" required
								name="txttelefono" value="${adm.getTelefono()}"	placeholder="Ingrese Telefono" aria-label="First name">
							</div>
							<div class="form-group col-sm-12 col-md-4">
								<label for="exampleInputEmail1" class="form-label">Sexo</label>
								<select class="form-control form-select" id="validationDefault04" required name="txtsexo" >
									<option  value="">Seleccione</option>
									<tools:cboSexoPar valor="${adm.getSexo()}"/>
								</select>
							</div>
						</div>
			
						<div class="row mb-3 form-group">
							<div class="col-sm-12 col-md-4 ">
								<label for="exampleInputEmail1" class="form-label">Fecha
									Nacimiento</label> <input type="text" class="form-control" 
									name="fecha" value="${adm.getFecha_nac()}" placeholder="First name" aria-label="First name">
							</div>
							<div class="col-sm-12 col-md-4">
								<label for="exampleInputEmail1" class="form-label">Ciudad
								</label> <select class="form-control" id="validationDefault04" required name="txtciudad" aria-label="Default select example">
									<option  value="">Seleccione</option>
									<!-- mi etiqueta pers -->
									<tools:cboCiudadPar valor="${adm.getCod_ciu()}"/>
								</select>
							</div>
						</div>
						

						<button type="submit" name="btnMUGI" value="reg" class="btn btn-primary">Registrar</button>
						<button type="submit" name="btnMUGI" value="act" class="btn btn-warning">Actualizar</button>
						<button type="submit" name="btnMUGI" value="ali" class="btn btn-danger">Eliminar</button>
						<button type="submit" name="btnMUGI" value="list"class="btn btn-primary">Listar</button>
					</form>
					${mensaje }
				</div>
			</div>
		</div>
		<div class="row justify-content-center mt-3">
		     <div class="col-sm-12 col-md-12 col-lg-11" style="background: #F5F6CE">
		      <div style="padding: 10px">
					<div class="table-responsive">
						<table class="table  table-striped  table-hover" id="myTable" style="background: white">
							<thead>
								<tr class="table-dark">
									<th scope="col">Codigo</th>
									<th scope="col">Nombre</th>
									<th scope="col">Apellido</th>
									<th scope="col">Direccion</th>
									<th scope="col">Telefono</th>
									<th scope="col">Sexo</th>
									<th scope="col">Fecha Nacimiento</th>
									<th scope="col">Ciudad</th>
									<th scope="col">b</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="pr">
									<tr class="grilla_campo">
										<th>${pr.getCod_adm()}</th>
										<th>${pr.getNombre()}</th>
										<th>${pr.getApellido()}</th>
										<th>${pr.getDireccion()}</th>
										<th>${pr.getTelefono()}</th>
										<th>${pr.getSexo()}</th>
										<th>${pr.getFecha_nac()}</th>
										<th>${pr.getNomciu()}</th>
										<td><form action="AdminServlet" method="post">
												<input type="hidden" name="txtcodigo"
													value="${pr.getCod_adm()}">
												<button class="btn btn-link" type="submit" name="btnMUGI" value="buscar">
													<img alt="" src="img/editar.png" onmouseover="src='img/editar2.png'" onmouseout="src='img/editar.png'">
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

  <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>Profile</h2>
                    </div>

                    <form  method="post" class="form-horizontal" >
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Full name</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="firstName" placeholder="First name" />
                                <span class="help-block" id="firstNameMessage" />
                            </div>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="lastName" placeholder="Last name" />
                                <span class="help-block lastNameMessage" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Username</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="username" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary">Sign up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
    
    
    
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
    
    <!-- JS principal -->
   <!--	<script src="js/jquery-3.5.1.js"></script>
		<script src="js/jquery-3.6.3.js"></script>  -->
	
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	
	<!--JS para validar  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
	
	<!-- js de DataTable -->
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
    $('#myTable').DataTable( {
        "language": {
        	"next": "Siguiente",
            "previous": "Anterior",
            "lengthMenu": "Mostrar _MENU_ Registros por pagina",
            "zeroRecords": "Nothing found - sorry",
            "info": "Mostrando pagina_PAGE_ de _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)",
             "search": "Buscar"
            
        }
    } );
} );


</script>

		<script>
		$(document).ready(function () {
		  
		    //validación
		    $('#formDocente').bootstrapValidator({      
	        	 fields:{
	        		 txtnombre:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo nombre es obligatorio'
	        		 			},
	        		 			stringLength: {
	                                 min: 3,
	                                 max: 50,
	                                 message: 'El nombre es de 3 a 50 caracteres'
	                             }
	        		 		}
	        		 	},
	        		 	txtapellido:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo apellido es obligatorio'
	        		 			},        		 			
	        		 			stringLength: {
	                                 min: 3,
	                                 max: 50,
	                                 message: 'El apellido es de 3 a 50 caracteres'
	                             }
	        		 		}
	        		 	},      		 
	        		 	txtdirec:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo direccion es obligatorio'
	        		 			},
	        		 			stringLength: {
	                                 min: 3,
	                                 max: 50,
	                                 message: 'El direccion es de 3 a 50 caracteres'
	                             }
	        		 		}
	        		 	},
	        		 
	        		 	txttelefono: {
		     	    		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo telefono es obligatorio'
	        		 			},
	        		 			regexp: {
									regexp: /^(\d{9})$/,
									message: 'Campo telefono 9 digitos'
								},
	        		 		}
		                },
		                txtsexo: {
		     	    		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo sexo es obligatorio'
	        		 			}
	        		 		}
		                },
		                txtciudad: {
		     	    		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo ciudad es obligatorio'
	        		 			},
	        		 			stringLength: {
	                                 min: 3,
	                                 max: 50,
	                                 message: 'El ciudad es de 3 a 50 caracteres'
	                             }
	        		 		}
		                },
		                fecha: {
							//selector:'#usr1',   
							validators: {
								notEmpty: {
									message: 'Seleccione fecha '
								},
								date: {					
								    format: 'YYYY-MM-DD',
									message: 'The format is dd/mm/yyyy'
								},
							}
						},
		    
						
	        	 }
	        })
	      
		 
		    
		});
	</script>



</body>

	

</html>