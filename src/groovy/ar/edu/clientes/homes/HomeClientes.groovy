package ar.edu.clientes.homes

import ar.edu.clientes.ClientePosta
import ar.edu.clientes.ClientePromocion
import ar.edu.clientes.ClienteSafeShop
import ar.edu.clientes.busqueda.ClienteBusqueda

@Singleton
class HomeClientes {

	def clientes
	
	HomeClientes() {
		clientes = generarClientes()
	}

	def getClientes(ClienteBusqueda clienteBusqueda) {
		clientes.findAll {
			cliente -> clienteBusqueda.cumple(cliente)
		}
	}
		
	def generarClientes() {
		[
			new ClientePosta("Swiss medical", 1500),
			new ClienteSafeShop(new ClientePosta("SIEMENS", 0), 500),
			new ClientePromocion(new ClientePosta("Jodor S.A.", 250)),
			new ClienteSafeShop(new ClientePosta("Matanga Hermanos", 780), 600),
			new ClientePosta("Ocho Cientos", 800)
		]
	}
}
