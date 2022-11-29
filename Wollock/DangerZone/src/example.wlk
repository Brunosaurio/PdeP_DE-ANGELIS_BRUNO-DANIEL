/** First Wollok example */
class Empleado{
	var property habilidades = []
	var property subordinados = [] 
	var property saludRestante
	method saludCritica()
	method estaCapacitado() = saludRestante >= self.saludCritica()
	method puedeUsar(habilidad) = self.estaCapacitado() && (habilidades.contains(habilidad) || subordinados.any({sub => sub.puedeUsar(habilidad)}))  
	method efectoDeMision(mision){
		if (mision.equipoAsignado().size() <= 1){
			self.saludRestante(self.saludRestante() - mision.peligrosidad())
		}else self.saludRestante(self.saludRestante() - mision.peligrosidad() / 3)
	}
}

class Oficinista inherits Empleado{ 
	var property cantEstrellas = 0
	override method saludCritica() = 40 - 5 * cantEstrellas
 	override method efectoDeMision(mision){
		cantEstrellas = cantEstrellas + 1
		super(mision)
	}
	method puedeAscender() = cantEstrellas > 3
}
class Espia inherits Empleado{
	override method saludCritica() = 15
 	override method efectoDeMision(mision){
		const nuevasHabilidades = (self.habilidades() + mision.habDelEquipo()).asSet()
		self.habilidades(nuevasHabilidades)
		super(mision)
	}
}
class Mision{
	var property descripcion
	var property equipoAsignado = []
	var property habilidadesReq
	var property peligrosidad
	method habDelEquipo() = equipoAsignado.map({miembro => miembro.habilidades()}).flatten()
	method sePuedeCompletar(){
		return habilidadesReq.all({hab => self.habDelEquipo().contains(hab)}) && equipoAsignado.all({espia => espia.estaCapacitado()})
	}
	method empezarMision(){
		equipoAsignado.forEach({espia => espia.efectoDeMision(self)})
	}
}