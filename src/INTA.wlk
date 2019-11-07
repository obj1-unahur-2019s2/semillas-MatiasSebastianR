import parcelas.*

object inta {
	var parcelas = []
	
	method promedioDePlantas() { }

	method masAutentable() { }	
	
}

// Al Instituto Nacional de Tecnología Agropecuaria (INTA), le interesa realizar una serie de estadísticas sobre todas las parcelas del país. Para ello, agregaremos al modelo un objeto único que represente al INTA, en el cual mantendremos una colección de parcelas.
//
// Se pide realizar dos estadísticas:
//
//    el promedio de plantas por parcela. Recordar para esto que un promedio se calcula como la suma (de plantas que hay en cada parcela) dividido por la cantidad (de parcelas que existen);
//    obtener la parcela más autosustentable. Para esto, solo consideraremos aquellas parcelas con más de 4 plantas y elegiremos aquella que tenga mayor porcentaje de plantas "bien asociadas" (ver etapa 5).
