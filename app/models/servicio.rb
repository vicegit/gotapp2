class Servicio < ApplicationRecord

	has_many :detallefacturas
  	has_many :facturas, through: :detallefacturas
	before_save :mayusculas

	#Validaciones de concepto
	validates :concepto, :presence => {:message => "Debe ingresar un concepto"}, 
		:uniqueness => {:message => "El concepto ya está registrado"}, 
		length: {minimum: 6, maximum: 100, :message => "El concepto debe tener entre 6 y 100 caracteres"}

	#Validaciones de m3
	validates :m3, :presence => {:message => "Debe ingresar un m3"},  
		length: {minimum: 1, maximum: 5, :message => "El m3 debe tener entre 1 y 5 caracteres"},
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de tarifa
	validates :tarifa, :presence => {:message => "Debe ingresar una tarifa"},  
		length: {minimum: 4, maximum: 7, :message => "La tarifa debe tener entre 4 y 7 caracteres"},
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

   def mayusculas
      self.concepto.upcase!
   end

end