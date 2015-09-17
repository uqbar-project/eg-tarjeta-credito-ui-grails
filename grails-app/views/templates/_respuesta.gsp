<div id="comprar-respuesta">
	<g:if test="${mensajeOk}">
		<div class="alert alert-info" id="mensajeOk">
			${mensajeOk}
		</div>
	</g:if>
	<g:if test="${mensajeError}">
		<div class="alert alert-danger" id="mensajeError">
			${mensajeError}
		</div>
	</g:if>
</div>
