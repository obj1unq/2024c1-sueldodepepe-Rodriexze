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

object sofia {
	
	var categoria = cadete
	var tipoDeBonoResultado = nulo
	
	method sueldo() {
		return self.neto() + self.valorBonoResultado ()
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method neto(){
		return categoria.neto() * 1.3
	}
	
	method valorBonoResultado () {
		return tipoDeBonoResultado.valor(self)
	}
	
	method bonoResultado(_bonoResultado) {
		tipoDeBonoResultado = _bonoResultado
	}
}

object roque {
	
	var tipoDeBonoResultado = nulo
	
	method neto(){
		return 28000
	}
	
	method sueldo() {
		return self.neto() + self.valorBonoResultado() + self.extra()
	}
	
	method extra(){  // para no dejar el numnero en sueldo le cree un metodo
		return 9000
	}
	
	method bonoResultado(_bonoResultado) {
		tipoDeBonoResultado = _bonoResultado
	}
	
	method valorBonoResultado() {
		return tipoDeBonoResultado.valor(self)
	}
}

object ernesto {
	
	var companiero = pepe
	const faltas = 0  //dejo esto como constante y no le creo un setter a faltas por que el ejercicio me dice que se sabe que ernesto no falta nunca
	
	method neto(){  // dejando un prametro compañero hago que el neto dependa del neto de su compañero
		return companiero.neto()
	}
	
	method valorBonoPresentismo() {
		return normal.valor(self)
	}
	
	method setCompaniero(_companiero){
		companiero = _companiero
	}
	
	method sueldo() {
		return self.neto() + self.valorBonoPresentismo()
	}
	
	method asistenciaPerfecta() {
		return self.faltas() == 0
	}
	
	method faltas(){
		return faltas
	}
}

object vendedor {
	
	var hayMuchasVentas = false
	
	method neto(){
		return 16000
	}
	
	method sueldo() {
		return self.neto() * self.bonificacionPorVentas()
	}
	
	method bonificacionPorVentas() {
		return if (hayMuchasVentas) {1.25}
			else {1}
		} 
	
	method activarAumentoPorMuchasVentas(){
		hayMuchasVentas = true
	}
	
	method desactivarAumentoPorMuchasVentas(){
		hayMuchasVentas = false
	}
}

object medioTiempo { // no se si este objeto internamente esta bien estoy seguro que el problema esta aca
	
	var categoria = cadete
	
	method neto(empleado){
		return categoria.neto() / 2
	}
	
	method categoriaBase(_categoria){
		categoria = _categoria
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