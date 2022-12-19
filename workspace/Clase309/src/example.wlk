class Obrero {
//object jony
	var recursos = 1000
	var arma = esoQueSirveParaAtacar
	const cosasConstruidas=[]
	method construir(algo) {
		cosasConstruidas.add(algo)
		recursos = recursos - algo.cuantosRecursosRequiere()
	}
	method totalRecursosUtilizados(){
		cosasConstruidas.sum{c=>c.cuantosRecursosRequiere()}
	}
	method puedeDefenderse(){
		return arma.esFuerte()
	}
	method recursos()= recursos
}
object laQueEstaAlLadoDelRio{
	method cuantosRecursosRequiere(){
		return 100
	}
}
object castilloDelRey{
	
}
object puente{
	
}
object elRemanso{
	method cuantosRecursosRequiere(){
		return 120
	}
}
object esoQueSirveParaAtacar{
	method esFuerte() = true
}