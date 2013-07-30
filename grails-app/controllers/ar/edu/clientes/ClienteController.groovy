package ar.edu.clientes

import ar.edu.clientes.busqueda.ClienteBusqueda
import ar.edu.clientes.exceptions.BusinessException
import ar.edu.clientes.homes.HomeClientes

class ClienteController {

	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		def clienteBusqueda = new ClienteBusqueda(params.desde, params.hasta)
		[mapaClientes: HomeClientes.instance.getClientes(clienteBusqueda), clienteBusqueda: clienteBusqueda]
	}

	def comprar() {
		def mensajeError = ""
		def mensajeOk = ""
		flash.message = ""
		try {
			def idCliente = new Integer(params.idCliente)
			def cliente = HomeClientes.instance.getCliente(idCliente)
			def monto = new Integer(params.monto)
			cliente.comprar(monto)
			mensajeOk = "El cliente compró por \$ " + monto + " exitosamente"
		} catch (NumberFormatException e) {
			mensajeError = "El monto debe ser numérico"
		} catch (BusinessException e) {
			mensajeError = e.message
		} catch (Exception e) {
			e.printStackTrace()
			mensajeError = "Hubo un error en la aplicación. Consulte al administrador"
		}
		//[mensajeError: mensajeError]
		render template:'/templates/respuesta', model: [ mensajeError: mensajeError, mensajeOk: mensajeOk ]
	}
}
