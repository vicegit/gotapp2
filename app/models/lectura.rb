class Lectura < ApplicationRecord
	before_save :campos_automatizados, :mayusculas

	def campos_automatizados
		self.periodo_id = Periodo.last.id
		self.fecha = Date.today
		#self.lector = user.current_user.email
	end

   	def mayusculas
   		#self.lector.upcase!
  	end
end