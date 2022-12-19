class Expedicion{
	var property vikingos = []
	var property lugaresAVisitar = []
	method agregarExpedito(vikingo){
		if (vikingo.puedeIrDeExpedicion()){
			vikingos.add(vikingo)
		}
	}
	method valeLaPena(){
		lugaresAVisitar.all({lugar => lugar.valeLaPena()})
	}
}
class Vikingo{
	var property claseSocial
	method puedeIrDeExpedicion() = self.esProductivo() && claseSocial.puedeIr(self)
	method esProductivo()
}
class Soldado inherits Vikingo{
	var property armas = 0
	var property vidasCobradas = 0
	override method esProductivo() = self.tieneArmas() && vidasCobradas > 20
	method tieneArmas() = armas > 0
}
class Granjero inherits Vikingo{
	var property hijos
	var property hectareas
	override method esProductivo() = 2 * hectareas >= hijos
	method tieneArmas() = false
}
class Casta{
	method puedeIr(vikingo) = true
}
object jarl inherits Casta{
	override method puedeIr(vikingo){
		return vikingo.tieneArmas().negate()
	}
}
object tarl inherits Casta{
	method descripcion(){
		return "media"
	}
}
object karl inherits Casta{
	method descripcion(){
		return "noble"
	}
}