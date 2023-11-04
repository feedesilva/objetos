class Vikingo{
	var property casta
	method esProductivo() 
	method puedeExpedicion() = self.esProductivo() && (casta != jarl || self.esJarlSinArma())
	method irAExpedicion(expedicion){
		if(self.puedeExpedicion()){
			expedicion.vikingos().add(self)
			return "logrADO"
		}
		else{
			throw new DomainException (message = "error. No puede subir")
		}
	}
	method esJarlSinArma() = casta == jarl 
	method ascenderCasta() = 
		if(self.esJarlSinArma()){
			casta = karl
			self.asciendeAKarl()
		}
		else{
			if(self.esJarlSinArma()){
				casta = thrall 
			}
		}
	method asciendeAKarl()
}

class Soldado inherits Vikingo{
	var property armas = []
	var property vidasCobradas
	override method esProductivo() = vidasCobradas > 20 && armas.size() != 0
	override method esJarlSinArma() = super() && armas.size() == 0
	override method asciendeAKarl() = armas.size(10)
	//10.times(armas.add{arma => arma})
}

class Granjero inherits Vikingo{
	var property hijos
	var property ha
	override method esProductivo() = ha >= 2*hijos
	override method asciendeAKarl() = self.hijos(2) && self.ha(2)
}

class Expedicion{
	var property aldea
	var property capital
	var property vikingos = []
	method expVale() = aldea.valeLaPena(vikingos) && capital.valeLaPena(vikingos) 
}

class Capital{
	var property factorRiqueza
	method defensoresDerrotados(vikingos) = vikingos.size()
	method monedasGanadas(vikingos) = self.defensoresDerrotados(vikingos)*factorRiqueza 
	method valeLaPena(vikingos) = self.monedasGanadas(vikingos) >= 3 * vikingos.size()
}

class Aldea{
	var property cantCrucifijos
	method monedasGanadas() =cantCrucifijos
	method valeLaPena(vikingos) = self.monedasGanadas() >= 15 
}

class AldeaAmurallada inherits Aldea{
	var property cantidadMinima
	override method valeLaPena(vikingos) = super(vikingos) && vikingos.size() >= cantidadMinima
}


object jarl{
	
}

object karl{
	
}

object thrall{
	
}

object ragnar{}
