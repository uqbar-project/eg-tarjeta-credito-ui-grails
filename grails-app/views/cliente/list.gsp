<%@ page import="ar.edu.clientes.AbstractCliente"%>
<%@ page import="ar.edu.clientes.converters.Conversor"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
	<div class="modal fade" id="comprar-modal">
		<div class="modal-dialog">
			<form class="form-comprar">
				<g:render template="/templates/respuesta"/>
				<g:hiddenField name="idCliente" />
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="labelClienteNombre"></h4>
					</div>
					<div class="modal-body">
						<div class="control-label inline">
							<label>Comprar: </label>
						</div>
						<input type="text" class="form-control" id="monto" name="monto"
							placeholder="Monto en $$$">
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal">Cerrar</button>
						<g:submitToRemote value="Comprar" class="btn btn-primary"
							action="comprar" update="comprar-respuesta" />
					</div>
				</div>
			</form>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div style="width: 90%; padding: 15pt;">
		<div class="clearfix content-heading">
			<h2>&nbsp;Clientes</h2>
		</div>

		<div class="panel-group" id="accordionBusqueda">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordionBusqueda" href="#collapseOne">
						Par&aacute;metros de b&uacute;squeda </a>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<form class="form-search">
							<div class="row">
  								<div class="col-md-5">
									<label>Saldo desde:</label> 
									<input type="text" name="desde" id="desde" class="form-control" placeholder="Desde..." value="${clienteBusqueda?.desde}">
								</div>
								<div class="col-md-5">
									<label>Hasta:</label> 
									<input type="text" class="form-control" name="hasta" id="hasta" placeholder="Hasta..." value="${clienteBusqueda?.hasta}">
								</div>
	 							<div class="col-md-2">
	 								<br>
									<button type="submit" class="btn btn-primary" title="Buscar clientes">
										<span class="glyphicon glyphicon-search">
										</span>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="panel-group" id="accordionResultados">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordionResultados" href="#collapseTwo"> Resultados
						</a>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							<div id="cliente-libro" class="content scaffold-list">
								<table
									class="table table-striped table-bordered table-hover table-condensed">
									<thead>
										<g:sortableColumn property="nombre" title="Nombre" />
										<g:sortableColumn property="saldo" title="Saldo"
											style="text-align: right;" />
										<g:sortableColumn property="montoCredito"
											title="Monto de crédito" style="text-align: right;" />
									</thead>
									<tbody>
										<g:each in="${mapaClientes}" status="i" var="entrada">
											<g:set var="idCliente" value="${entrada.key}" />
											<g:set var="cliente" value="${entrada.value}" />
											<g:set var="montoCredito" value="${cliente.montoCredito()}" />
											<tr class="${(i % 2) == 0 ? 'info' : ''}">
												<td>
													${cliente.nombre() }
												</td>
												<td style="text-align: right;">
													<g:if test="${cliente.esMoroso()}">
														<h4><span class="label label-danger">
														${Conversor.convertir(cliente.saldo())}
														</span></h4>
													</g:if>
													<g:else>
														<h4><span class="label label-success">
														Sin deuda
														</span></h4>
													</g:else>
												</td>
												<td style="text-align: right;">
													${montoCredito ? Conversor.convertir(montoCredito) : "Sin línea de crédito" }
												</td>
												<td>
													<a data-toggle="modal" data-cliente="${cliente.nombre()}"
														data-id-cliente="${idCliente}" data-target="#comprar-modal"
														class="open-Comprar btn btn-primary">
														Comprar
														<span class="glyphicon glyphicon-shopping-cart"></span>
													</a></td>
											</tr>
										</g:each>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).on("click", ".open-Comprar", function() {
			name = $(this).data('cliente');
			idCliente = $(this).data('id-cliente');
			$('#mensajeOk').hide();
			$('#mensajeError').hide();
			$('#monto').val("");
			$('#labelClienteNombre').html(name);
			$('#idCliente').val(idCliente);
		})
	</script>
</body>
</html>
