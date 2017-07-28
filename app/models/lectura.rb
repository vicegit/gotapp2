class Lectura < ApplicationRecord

	belongs_to :cliente
	belongs_to :periodo

	#Validaciones de número
	validates :numero, :presence => {:message => "Debe ingresar un número"}, 
		length: {minimum: 1, maximum: 8, :message => "El número debe tener entre 1 y 8 caracteres"}, 
	
	#Validaciones de actual
	validates :actual, :presence => {:message => "Debe ingresar el actual"}, 
	length: {minimum: 1, maximum: 5, :message => "El actual debe tener entre 1 y 5 caracteres"}
	:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

  	private
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