object bibliotecaDeJuegos{
	var almacen = [carlosDuty,crashBandido,loLeyends]
	
}
class Juego{
	const preciOriginal
	var property descuentoAplicado = sinDescuento
	method precio() = descuentoAplicado.aplicar(preciOriginal)
}
const carlosDuty = new Juego(preciOriginal = 100)
const crashBandido = new Juego(preciOriginal = 50)
const loLeyends = new Juego(preciOriginal = 2)
object descuentoDirecto{
	var property porcentajeDescuento = 10
	method aplicar(precio) = precio - precio * porcentajeDescuento/100
}
object sinDescuento{
	method aplicar(precio) = precio
}
object descuentoFijo{
	var property porcentajeDescuento = 10
	method aplicar(precio) = (precio*0.5).max(porcentajeDescuento)
}
object descuentoTotal{
	method aplicar(precio) = precio - precio
}

