class Lectura < ApplicationRecord

	#belongs_to :cliente
	#belongs_to :periodo

  	#private
  	#def self.crearlectura(numero, actual)
		#ActiveRecord::Base.connection.exec_query("CALL crearlectura ('#{numero}', #{actual}, @alerta)")
	#end
  	
  	#def mayusculas
   		#self.lector.upcase!
  	#end

	#def campos_automatizados
		#self.periodo_id = Periodo.last.id
		#self.fecha = Date.today
		#self.lector = user.current_user.email
	#end

end