object pepe {
	
	var categoria = cadete
	var tipoDeBonoResultado = nulo
	var bonoPresentismo = normal
	var faltas = 0
	
	method sueldo(){
		return self.neto() + self.valorBonoResultado () + self.valorBonoPresentismo()
	}
	
	method neto(){
		return categoria.neto()
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method bonoResultado(_bonoResultado) {
		tipoDeBonoResultado = _bonoResultado
	}
	
	method bonoPresentismo(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo
	}
	
	method valorBonoResultado () {
		return tipoDeBonoResultado.valor(self)
	}
	
	method valorBonoPresentismo () {
		return bonoPresentismo.valor(self)
	}
	
	method faltas(_faltas){
		faltas = _faltas
	}
	
	method faltas(){
		return faltas
	}
	
	method asistenciaPerfecta() {
		return self.faltas() == 0
	}
}

object normal{
	
	method valor(empleado){
		return if (empleado.asistenciaPerfecta()) {2000}
			else if (empleado.faltas() == 1) {1000}
			else {0}
	}
}

object ajuste{
	
	method valor(empleado){
		return if (empleado.asistenciaPerfecta()) {100}
				else {0}
	}
}

object demagogico{
	
	method valor(empleado){
		return if (empleado.neto() < 18000 ) {500}
			else {300}
	}
}

object presentismoNulo {
	method valor(){
		return 0
	}	
}


object porcentual{
	
	method valor(empleado){
		return empleado.neto() * 0.10
	}
}

object fijo{
	
	method valor(empleado){
		return 800
	}
}

object nulo{
	
	method valor(empleado){
		return 0
	}
}

object cadete {
	
	method neto(){
		return 20000
	}
}

object gerente {
	
	method neto(){
		return 15000
	}
}