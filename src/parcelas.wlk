import semillas.*

class Parcelas{
	var property ancho
	var property largo
	var property horasDeSol
	var plantas = []
	
	method plantaMasAlta() { return plantas.max({ cosa => cosa.altura()}) }
	method superficie () { return ancho * largo }
	method cantidadMaxima() { return
		if ( ancho > largo ) { self.superficie() /5 }
		else { (self.superficie()/3) + largo } 
	}
	method tieneComplicaciones() { return  plantas.any({ cosa => cosa.horasDeSolTolera() < self.horasDeSol() })  }
	//
	method plantarUnaPlanta(planta) { return
		if (planta.horasDeSolTolera()< (horasDeSol +2) or self.cantidadMaxima() > plantas.size())
		{ plantas.add(planta) }
		else { self.error("No se puede plantar")}
	 }	
	 
//	 poder plantar una planta que se recibe por parámetro. El efecto que produce es que se agregue a la colección.
//	 Esto debe arrojar un error si al plantar se supera la cantidad máxima o bien si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.
	 
	 method sumaDePlantas() { return plantas.size() }
	 
	 method seAsociaBien(planta)
}
	
class ParcelasEcologicas inherits Parcelas {
	
	override method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
}

class ParcelasIndustriales inherits Parcelas {
	
	override method seAsociaBien(planta) {
		return self.sumaDePlantas() <= 2 and planta.esFuerte()
	}
}

//
//    para las parcelas ecológicas: que la parcela no tenga complicaciones y sea ideal para la planta;
//    para las parcelas industriales: que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.






//    su ancho y su largo, medidos en metros. (Para evacuar dudas: sí, van en dos atributos distintos.);
//    cuántas horas de sol recibe por día;
//    las plantas que tiene, representadas por una colección.


//    conocer la superficie de la parcela, que se calcula... multiplicando ancho por largo;
//    saber la cantidad máxima de plantas que tolera, que se calcula de la siguiente manera: si el ancho es mayor que el largo, la cuenta es superficie / 5; si no superficie / 3 + largo;
//    saber si tiene complicaciones, lo cual es así si alguna de sus plantas tolera menos sol del que recibe la parcela;
//    poder plantar una planta que se recibe por parámetro. El efecto que produce es que se agregue a la colección.
//    Esto debe arrojar un error si al plantar se supera la cantidad máxima o bien si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.
