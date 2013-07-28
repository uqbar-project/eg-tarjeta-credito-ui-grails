package ar.edu.clientes.busqueda

import ar.edu.clientes.AbstractCliente

class ClienteBusqueda {

	BigDecimal desde
	BigDecimal hasta
	
	ClienteBusqueda(pDesde, pHasta) {
		if (pDesde) {
			desde = new BigDecimal(pDesde)
		}
		if (pHasta) {
			hasta = new BigDecimal(pHasta)
		}
	}
	
	def cumple(AbstractCliente cliente) {
		def saldo = cliente.saldo().doubleValue()
		(!desde || saldo >= desde) && (!hasta || saldo <= hasta)
	}
	
}
