/** Bruno De Angelis, 42680881, 1763982*/
class Atrapada{
	var property hechaPor
	var property atrapoA
	var property enSeg
	var property puntaje
	method atrMay10(){
		return puntaje > 10
	}
	method atrPuntajeBajo(){
		return (self.atrMay10()).negate()
	}
}
class Personaje{
	var property nombre
	var property duenio 
	var property atrapadas
	var property recPerComp
	method nombre() = nombre
	method atraparA(personaje,seg,punt){
		const atrapadaNueva = new Atrapada(hechaPor = self, atrapoA = personaje, enSeg = seg, puntaje = punt)
		atrapadas.add(atrapadaNueva)
	}
	method atrapadasRealizadas(){
		return atrapadas.size()
	}
	method cantAtrMay10(){
		return atrapadas.count({atrapada => atrapada.atrMay10()})
	}
	method atrapoA(){
		return atrapadas.map({atrapada => (atrapada.atrapoA())})
	}
}
const napoleon = new Personaje (nombre = "napoleon",duenio = jorgi , atrapadas = [], recPerComp = [])
const jorgi = new Jugador(nombre = "jorgi", gemasImportantes = [ruby, diamante])
class Jugador{
	var property nombre
	var property gemasImportantes 
	var personajes = [napoleon]

	method agregarPersonaje(personaje){
		personajes.add(personaje)
	}
	method atrapadasDelJugador(){
		return (personajes.map({pers => pers.atrapadas()})).flatten()
	}
	method atrapadasTotales(){
		return (personajes.map({personaje => (personaje.atrapadas()).size()})).sum()
	}
	method persConMasAtr(){
		return (personajes.max({pers => pers.cantAtrMay10()})).nombre()
	}
	method adversariosAtrapados(){
		return (((self.atrapadasDelJugador()).filter({atr =>atr.atrPuntajeBajo()})).map({atr => ((atr.atrapoA()).duenio()).nombre()})).asSet()
	}
}
class Recurso{
	var property cotizacion
}

