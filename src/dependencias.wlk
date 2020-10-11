import rodados.*
import pedidos.*


class Dependencia {
	
	const property flota = []
	var property cantidadEmpleados
	const property registroPedidos = []
	
	
	method agregarAFlota(r) {
		flota.add(r)
	}
	
	
	method quitarDeFlota(r) { 
		flota.remove(r)
	}
	
	method pesoTotalFlota() {
		return flota.sum({ r => r.peso() })
	}
	
	method estaBienEquipada() {
		return flota.size() >= 3 and flota.all({ r => r.velocidadMaxima() >= 100 })
	}
	
	method capacidadTotalEnColor(color) {
		return flota.filter({ r => r.color() == color }).sum({ r => r.capacidad() })
	}
	
	method colorDelRodadoMasRapido() { 
		return flota.max({ r => r.velocidadMaxima() }).color()
	}
	
	method capacidadFaltante() { 
		return 0.max(cantidadEmpleados - self.capacidadTotalDeLaFlota())
	}
	
	method capacidadTotalDeLaFlota() { 
		return flota.sum({ r => r.capacidad() })
	}	
	
	method esGrande() { 
		return cantidadEmpleados >= 40 and flota.size() >= 5
	}
	
	
	method agregarPedido(pedido) { registroPedidos.add(pedido) }
	
	method quitarPedido(pedido) { registroPedidos.remove(pedido) }
	
	method totalDePasajerosEnPedidosRegistrados() {
		return registroPedidos.sum({ p => p.cantidadPasajeros() })
	}
	
	method pedidosNoSatisfacibles() {
		return registroPedidos.filter({ p => not self.tenesAutoPara(p) })
	}
	method tenesAutoPara(pedido) {
		return flota.any({ r => pedido.satisfacePedido(r) })
	}
	
	method esIncompatible(color) { 
		return registroPedidos.all({ p => p.coloresIncompatibles().contains(color) })
	}
	
	method relajarPedidos() { registroPedidos.forEach({ p => p.relajar() }) }
	
}






