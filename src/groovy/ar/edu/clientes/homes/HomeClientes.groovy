package ar.edu.clientes.homes

import ar.edu.clientes.ClientePosta
import ar.edu.clientes.ClientePromocion
import ar.edu.clientes.ClienteSafeShop
import ar.edu.clientes.busqueda.ClienteBusqueda
import ar.edu.clientes.exceptions.BusinessException

@Singleton
class HomeClientes {
	
	Map clientes = generarClientes()
	
	def getCliente(idCliente) {
		def cliente = clientes.get(idCliente)
		if (!cliente) {
			throw new BusinessException("El cliente " + idCliente + " no existe en el repositorio")
		}
		cliente
	}
	
	def getClientes(ClienteBusqueda clienteBusqueda) {
		clientes.entrySet().findAll {
			entry -> def cliente = entry.value
					 clienteBusqueda.cumple(cliente)
		}
	}
		
	def generarClientes() {
		[
			1: new ClientePosta("Swiss medical", 1500),
			2: new ClienteSafeShop(new ClientePosta("SIEMENS", 0), 500),
			3: new ClientePromocion(new ClientePosta("Jodor S.A.", 250)),
			4: new ClienteSafeShop(new ClientePosta("Matanga Hermanos", 780), 400),
			5: new ClientePosta("Ocho Cientos", 800)
		]
	}
	
}
