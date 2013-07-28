package ar.edu.clientes

import ar.edu.clientes.busqueda.ClienteBusqueda
import ar.edu.clientes.homes.HomeClientes

class ClienteController {

	def index() {
		redirect(action: "list", params: params)
	}
	
	def list() {
		def clienteBusqueda = new ClienteBusqueda(params.desde, params.hasta)
		[clientes: HomeClientes.instance.getClientes(clienteBusqueda), clienteBusqueda: clienteBusqueda]
	}

}
