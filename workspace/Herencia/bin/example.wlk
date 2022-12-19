class Persona{
	var property enfermedades = []
	var property temperatura = 36
	var property celulas = 3000000
	method contraer(enfermedad){
		if(enfermedades.size()<=6){
			enfermedades.add(enfermedad)
		}
		else self.error("Ya tengo suficientes enfermedades")
	}
	method vivirDia(){
		enfermedades.forEach{enfermedad => enfermedad.efecto(self)}
	}	
}
const logan = new Persona(enfermedades=[new Malaria(diasPadecida = 0, celulasQueAmenaza= 5000)])
//const carlos = new Persona(enfermedades=[], temperatura = 36, celulas = 3000000)
//const frank = new Persona(enfermedades = [], temperatura = 36, celulas = 3500000)
class Enfermedad{
	var property diasPadecida 
	var property celulasQueAmenaza
}
class EnfermedadInfecciosa inherits Enfermedad{
	method efecto(persona){
		persona.temperatura(45.min(persona.temperatura() + celulasQueAmenaza*0.001))  
	}
	method reproducirse(){
		celulasQueAmenaza = celulasQueAmenaza * 2
	}
	method esAgresivaPara(persona) = celulasQueAmenaza > persona.celulas()*0.1
}
class EnfermedadAutoinmune inherits Enfermedad{
	method efecto(persona){
		persona.celulas(persona.celulas()-celulasQueAmenaza)
	}
	method esAgresivaPara(persona) = persona.diasEnfermo() > 30 &&(persona.enfermedades()).contains(self)
}
class Malaria inherits EnfermedadInfecciosa{
	}


//const malaria = new EnfermedadInfecciosa(celulasQueAmenaza = 5000)
//const otitis = new EnfermedadInfecciosa(celulasQueAmenaza = 1000)
//const lupus = new EnfermedadAutoinmune(celulasQueAmenaza = 5000)