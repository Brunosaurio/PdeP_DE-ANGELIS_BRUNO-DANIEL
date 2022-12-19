object sistema{
	var afiliados = []
	var lugares = []
	method afiliados() = afiliados
	method agregarTurista(alguien){
		afiliados.add(alguien)
	}
	method lugares()= lugares
	method agregarLugar(lugar){
		lugares.add(lugar)
	}
	method pasoUnAnio(){
		afiliados.forEach({turista => turista.edad(turista.edad() + 1)})
	}
}
class Turista{
	var property edad
	var property cantMillas
	var property viajes = []
	method dinero() = self.cantMillas()* milla.cotizacion()
	method puedeVisitar(lugar){
		return lugar.puedeSerVisitadoPor(self)
	}
	method viajes() = viajes
	method viajarA(lugar){
		if(self.puedeVisitar(lugar)){
			lugar.bonificacion(self)
			viajes.add(lugar)
			self.cantMillas(self.cantMillas() - lugar.precioParaIngresoDe(self)/milla.cotizacion())
		} 
		else self.error("No puedo viajar a ese destino")
	}
	method visitoPais(pais){
		return viajes.any({destino => destino.paisUbicacion() == pais})
	}
	method vecesQueVisito(destino){
		return viajes.count({lugar => lugar == destino})
	}
}
class LugarTuristico{
	var property vecesVisitadoXMenores = 0
	var property precioEntrada
	var property paisUbicacion
	method puedeSerVisitadoPor(alguien){
		return alguien.dinero() >= self.precioParaIngresoDe(alguien)
	}
	method precioParaIngresoDe(alguien) = self.precioEntrada()
	method bonificacion(alguien){}
}
class LugarInfantil inherits LugarTuristico{
	
	override method puedeSerVisitadoPor(alguien) = 18 >= alguien.edad() && super(alguien)
	override method bonificacion(alguien){
		alguien.cantMillas(alguien.cantMillas() + 10)
		self.vecesVisitadoXMenores(self.vecesVisitadoXMenores() + 1)
	}
}
class LugarParaAdultosMayores inherits LugarTuristico{
	override method precioParaIngresoDe(alguien) {
		if(alguien.edad() >= 70) return self.precioEntrada()*4/5
		else return self.precioEntrada()
	}
	override method puedeSerVisitadoPor(alguien) = alguien.edad() >= 70 && super(alguien)
}
class LugarVip inherits LugarTuristico{
	override method puedeSerVisitadoPor(alguien) = alguien.cantMillas() >= 100 && super(alguien)
	//Los lugares Vip solo se pueden visitar por personas que tengan mas de 100 millas
	override method bonificacion(alguien){
	//La bonificacion de los lugares VIP es aumentar millas x viajes realizados
		alguien.cantMillas(alguien.cantMillas() + alguien.viajes().size())
	}
}

object milla{
	var property cotizacion = 100
}
