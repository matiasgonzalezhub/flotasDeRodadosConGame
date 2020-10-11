import wollok.game.*


class ChevroletCorsa {
	var property image = "autitorojo.png"
	var property position 
	const property posicionesVisitadas = #{}
	var property color
	
	method capacidad() { return 4 }
	method velocidadMaxima() { return 150 }
	method peso() { return 1300 }
	
	method cambiarPosicion(p) {
		 self.position(p)
		 posicionesVisitadas.add(p)
	}
	
	method getColor(){return color}
	method setColor(c){color = c}
	
	method pasoPor(posicion) { 
		return posicionesVisitadas.contains(posicion)
	}
	
	method posicionesVisitadasX() { 
		return posicionesVisitadas.map({ p => p.x() })
	}
	
	method posicionesVisitadasY() { 
		return posicionesVisitadas.map({ p => p.y() })
	}

	method pasoPorFila(f) { 
		return self.posicionesVisitadasX().contains(f)
	}
	
	method pasoPorColumna(c) { 
		return self.posicionesVisitadasY().contains(c)
	}
	
	method recorrioColumnas(lista_de_numeros) {
		return lista_de_numeros.all({ col => self.pasoPorColumna(col) })
	}
	

	method moverDerecha() { self.cambiarPosicion(self.position().right(1)) }
	method moverIzquierda() { self.cambiarPosicion(self.position().left(1)) }
	method moverArriba() { self.cambiarPosicion(self.position().up(1)) }
	method moverAbajo() { self.cambiarPosicion(self.position().down(1)) }
	
}


class RenaultKwid {
	var property tanqueAdicional = false
	
	method capacidad() { 
		return if (not tanqueAdicional) {4} else {3}
	}
	method velocidadMaxima() { 
		return if (not tanqueAdicional) {110} else {120}
	}
	method peso() { 
		return if (not tanqueAdicional) {1200} else {1350}
	}
	method color() { return "Azul" }
}


class AutoEspecial {
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
}


object trafic {
	
	var property motor = motorBataton
	var property interior = interiorPopular
	
	method capacidad() { return interior.capacidad() }
	method velocidadMaxima() { return motor.velocidadMaxima() }
	method peso() { return interior.peso() + motor.peso() + 4000 }
	method color() { return "Blanco" }
}

object interiorComodo {
	method capacidad() { return 5 }
	method peso() { return 700 }
}

object interiorPopular {
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object motorPulenta {
	method peso() { return 800 }
	method velocidadMaxima() { return 130 }
}

object motorBataton {
	method peso() { return 500 }
	method velocidadMaxima() { return 80 }
}


object blanco { method image() { return "blanco.png" } }
object rojo { method image() { return "autitorojo.png" } }
object azul { method image() { return "azulpng.png" } }
object beige { method image() { return "beige.png" } }
object negro { method image() { return "negro.png" } }
object verde { method image() { return "autoRojo.png" } }

