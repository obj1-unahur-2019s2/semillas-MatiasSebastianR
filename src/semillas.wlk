import parcelas.*

class Plantas {
	
	var property anioDeObtencion
	var property altura
	
	method horasDeSolTolera() 
	method esFuerte() { return self.horasDeSolTolera() >= 10 }
	method daSemillas() { return self.esFuerte() }
	method espacio()
	method parcelaIdeal(parcela)
	
	method asociaBienConParcela(parcela) {
		return parcela.seAsociaBien(self)
	}
}

class Menta inherits Plantas {
	
	override method horasDeSolTolera() {
		return 6
	}
	override method daSemillas() {
		return super() or altura > 0.4
	}
	override method espacio() {
		return altura*3
	}
	//
	override method parcelaIdeal(parcela) {
		return parcela.superficie() > 6 
	}
}

class Soja inherits Plantas {
	
	override method horasDeSolTolera() { return
		if (altura < 0.5) { 6 }
		else if ( altura.between(0.5, 1)) { 7 }
		else { 9 } 
	}
	override method daSemillas() {
		return super() or (anioDeObtencion > 2007 and altura > 1)
	}
	override method espacio() {
		return altura*0.5
	}
	override method parcelaIdeal(parcela) {
		return parcela.horasDeSol() == self.horasDeSolTolera()
	}
	
//    la soja común va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
	
}

class Quinoa inherits Plantas {
	var property horasDeSolTolera
	
	override method espacio() {
		return 0.5	
	} 
	override method daSemillas() {
		return super() or anioDeObtencion < 2005
	}
	
	override method parcelaIdeal(parcela) {
		return parcela.plantaMasAlta().altura() < 1.5
	}
	
//	override method parcelaIdeal(parcela) {
//		return parcela.plantas.max({ cosa => cosa.altura()}) < 1.5
//		}
//    la quinoa es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros;
	
}

class SojaTransgenica inherits Soja{
	
	override method daSemillas() {
		return false
	}
	
	override method parcelaIdeal(parcela) {
		return parcela.cantidadMaxima() <= 1
	}
//    la soja transgénica está pensada como monocultivo, así que prefiere parcelas cuya cantidad máxima de plantas sea igual a 1.
	
	
}

class HierbaBuena inherits Menta{
	
	override method espacio() {
		return super() *2
	}
}

//4. Parcelas ideales
//
//Cada planta define ciertas condiciones para saber si una parcela le resulta ideal:
//
//    la menta prefiere suelos extensos, por lo cual le resultan ideales las parcelas con una superficie mayor a 6 metros cuadrados.
//    La hierbabuena, como buena menta que es, se comporta igual;
//    la quinoa es bajita y por eso anda mejor en parcelas en las que no haya ninguna planta cuya altura supere los 1.5 metros;
//    la soja común va bien si la cantidad de sol que recibe la parcela es exactamente igual a los que ella tolera;
//    la soja transgénica está pensada como monocultivo, así que prefiere parcelas cuya cantidad máxima de plantas sea igual a 1.
//
//Agregar a las plantas la capacidad de decir si una parcela le resulta ideal.


//2. Variedades
//
//Agregar al modelo la soja transgénica y la hierbabuena, que son similares a la soja y a la menta respectivamente, pero con algunas diferencias.
//
//La soja transgénica nunca da nuevas semillas, porque las empresas que las comercializan las someten adrede a un proceso de esterilización
// (que les asegura no perder nunca a su clientes). Ojo: la consulta siempre tiene que dar falso, incluso si se cumple la condición general.
//
//La hierbabuena se esparce más rápido que la menta y por eso el espacio que ocupa es el doble del que ocuparía una planta de menta de las mismas características.




//Existen muchas cepas de esta nutritiva planta andina y es por eso que la cantidad de horas de sol que tolera la configuraremos para cada planta.
// Ocupa siempre 0.5 metros cuadrados y la condición alternativa para saber si da semillas es que el año de obtención de la semilla que le dio origen sea anterior al 2005.
//
//Por ejemplo:
//
//    si tenemos una quinoa que tolera 12 horas de sol y su semilla de origen es de 2010, se trata de una planta que da semillas.
//    si tenemos una planta que tolere 9 horas de sol pero cuya semilla de origen es de 2001, también da semillas.





//### Soja
//La tolerancia al sol depende de su altura:
//* menor a 0.5 metros: 6 horas;
//* entre 0.5 y 1 metro: 7 horas;
//* más de 1 metro: 9 horas;
//
//La condición alternativa para que de semillas es que su propia semilla sea de obtención reciente (posterior al 2007) y además su altura sea de más de 1 metro. El espacio que ocupa es la mitad de su altura.
//
//Por ejemplo, si tuviesemos una soja de 0.6 metros y de semilla de 2009, la planta tendría una tolerancia al sol de 7 horas, no daría semillas y ocuparía 0.3 metros cuadrados.


//Menta
//
//Tolera seis horas de sol al día. Como condición alternativa para saber si da semillas, hay que mirar si su altura es mayor a 0.4 metros. Como crece al ras del suelo, diremos que el espacio que ocupa es su altura multiplicada por 3.
//
//Ejemplos:
//
//    una menta de 1 metro, debería dar semillas y ocupar un espacio de 3 metros cuadrados.
//    una menta de solo 0.3 metros, no debería dar semillas y ocuparía 0.9 metros cuadrados de espacio.



//Comenzaremos modelando a cada una de las plantas que hay en la huerta, de las cuales podemos configurar los siguientes aspectos:
//
//    el año de obtención de la semilla. Es decir, en qué año la semilla que le dio origen se sacó de su planta "madre";
//    la altura que tiene, medida en metros.
//
//Además, queremos poder preguntarle:
//
//    cuántas horas de sol tolera;
//    si es fuerte o no;
//    si da nuevas semillas o no;
//    cuánto espacio ocupa una vez plantada, medido en metros cuadrados.
//
//De todos ellos, el año de obtención y la altura se configuran para cada planta; el resto se calcula en función de la especie y de características generales.
//
//Se dice que una planta es fuerte si tolera más de 10 horas de sol al día, esto es igual para todas las plantas. El cálculo de las horas de sol que tolera depende exclusivamente de cada especie (ver más abajo).
//
//Otro aspecto que nos interesa es saber si da nuevas semillas, para lo cual se tiene que cumplir que la planta sea fuerte o bien una condición alternativa, que define cada especie. En cuanto al espacio que ocupa, depende pura y exclusivamente de características de la especie.
//
//Contemplaremos las especies que se detallan a continuación.