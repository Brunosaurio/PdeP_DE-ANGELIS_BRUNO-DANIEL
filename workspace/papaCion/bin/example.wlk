object papa {
	var cantidad = 100
	var calidad = calidadBuena
	var impuesto = impuestoSimple
	var retencion = retencionEstatista
	var precioBuena = 3
	method calidad(nuevaCalidad){
		calidad = nuevaCalidad
	}
	method calidad(){
		return calidad
	}
	method impuesto(nuevo){
		impuesto = nuevo
	}
	method retencion(nuevo){
		retencion = nuevo
	}
	method precioBuena(){
		return precioBuena
	}
	method precioBuena(nuevo){
		precioBuena = nuevo
	}
	method cantidad(){
		return cantidad
	}
	method cantidad(nuevaCantidad){
		cantidad = nuevaCantidad
	}
	method costoDeProduccion() {
		return calidad.precio(cantidad,self)
	}
	method impuestos(){
		return impuesto.recargo(self)
	}
	method retenciones(){
		return retencion.retencion(self)
	}
	method importeTotal(){
		return self.costoDeProduccion()+self.impuestos()+self.retenciones()
	}	
}
//object operacionesComunes{
//	method costoDeProduccion(verdura){
//		return (verdura.calidad()).precio(verdura.cantidad(),verdura)
//	}
//}
object retencionEstatista{
	method retencion(verdura){
		if (verdura.costoDeProduccion()>1000) return 200
		else return 300
	}
}
object retencionPrivatizadora {
	method retencion(verdura){
		return 50 + verdura.cantidad()/10
	}
}
object retencionDemagogica{
	var retencion = 100
	method retencion(verdura){
		return retencion
	}
	method cambiarValor(nueva){
		retencion = nueva
	}
}
object retencionNula{
	method retencion(verdura){
		return 0
	}
}
object impuestoSimple{
	method recargo(verdura){
		return verdura.costoDeProduccion()*1.10
	}
}
object impuestoConGarantia{
	method recargo(verdura){
		return 100.max(verdura.costoDeProduccion()*1.05)
	}
}
object impuestoInventado{
	method recargo(verdura){
		if (verdura.costoDeProduccion()>1000) return 0
		else return verdura.costoDeProduccion()*2
	}
}
object calidadBuena{
	method precio(cantidad,verdura){
		return verdura.precioBuena()*cantidad
	}
}
object calidadRegular{
	method precio(cantidad,verdura){
		return pepe.cotizacion(verdura)*cantidad
	}
}
object calidadPremium{
	method precio(cantidad,verdura){
		return verdura.precioBuena()*cantidad*1.5
	}
}
object pepe{
	method cotizacion(verdura){
		if (verdura == papa) return 2
		else return 5
	}
}
object batata{
	var impuesto = impuestoSimple

	method impuesto(nuevo){
		impuesto = nuevo
	}	
	method costoDeProduccion() {
		return 1000
	}
	method impuestos(){
		return impuesto.recargo(self)
	}

	method importeTotal(){
		return self.costoDeProduccion()+self.impuestos()
	}
}
object impuestoCompuesto{
	method recargo(verdura){
		return (impuestoSimple.recargo(verdura) + impuestoConGarantia.recargo(verdura)) / 2
	}
}
object zapallo{
	var cantidad = 100
	var retencion = retencionDemagogica
	method cantidad(){
		return cantidad
	}
	method cantidad(nueva){
		cantidad = nueva
	}
	method costoDeProduccion(){
		return pepe.cotizacion(self)*cantidad
	}
	method retenciones(){
		return retencion.retencion(self)
	}
	method importeTotal(){
		return self.costoDeProduccion() + self.retenciones()/2
	}
}