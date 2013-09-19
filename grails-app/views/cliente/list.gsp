<%@ page import="ar.edu.clientes.AbstractCliente"%>
<%@ page import="ar.edu.clientes.converters.Conversor"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
	<div class="modal hide fade" id="comprar-modal">
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

		<div class="accordion" id="accordionPadre">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordionPadre" href="#collapseOne">
						Par&aacute;metros de b&uacute;squeda </a>
				</div>
				<div id="collapseOne" class="accordion-body collapse in">
					<div class="accordion-inner">
						<form class="form-search">
							<fieldset>
								<label>Saldo desde:</label> <input type="text" name="desde"
									id="desde" class="input" placeholder="Desde..."
									value="${clienteBusqueda?.desde}"> <label>Hasta:</label>
								<input type="text" class="input" name="hasta" id="hasta"
									placeholder="Hasta..." value="${clienteBusqueda?.hasta}">
								<button type="submit" class="btn btn-primary">
									<i class="icon-search icon-white"> </i>
								</button>
							</fieldset>
						</form>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordionPadre" href="#collapseTwo"> Resultados
						</a>
					</div>
					<div id="collapseTwo" class="accordion-body collapse in">
						<div class="accordion-inner">
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
												<td style="text-align: right;"><g:if
														test="${cliente.esMoroso()}">
														<span class="badge badge-success"> ${Conversor.convertir(cliente.saldo())}
														</span>
													</g:if> <g:else>
														<span class="badge badge-important"> Sin saldo </span>
													</g:else></td>
												<td style="text-align: right;">
													${montoCredito ? Conversor.convertir(montoCredito) : "Sin línea de crédito" }
												</td>
												<td><a data-toggle="modal"
													data-cliente="${cliente.nombre()}"
													data-id-cliente="${idCliente}" data-target="#comprar-modal"
													class="open-Comprar btn btn-primary">Comprar</a></td>
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
			name = $(this).data('cliente')
			idCliente = $(this).data('id-cliente')
			$('#mensajeOk').hide()
			$('#mensajeError').hide()
			$('#monto').val("")
			$('#labelClienteNombre').html(name)
			$('#idCliente').val(idCliente)
		})
	</script>
</body>
</html>

