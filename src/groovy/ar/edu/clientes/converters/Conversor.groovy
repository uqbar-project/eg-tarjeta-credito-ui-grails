package ar.edu.clientes.converters

import java.text.DecimalFormat

class Conversor {

	static String convertir(BigDecimal numero) {
		new DecimalFormat("###,##0.00").format(numero.doubleValue())
	}
}
