class Medidor < ApplicationRecord

	belongs_to :cliente
	before_save :mayusculas

	#Validaciones de numero
	validates :numero, :presence => {:message => "Debe ingresar un número de medidor"}, 
		:uniqueness => {:message => "El número de medidor ya está registrado"}, 
		length: {minimum: 1, maximum: 8, :message => "El número de medidor debe tener entre 1 y 8 caracteres"}

	#Validaciones de medicion
	validates :medicion, :presence => {:message => "Debe ingresar una medición"},  
		length: {minimum: 1, maximum: 5, :message => "La medición debe tener entre 1 y 5 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de cliente_id
	validates :cliente_id, :presence => {:message => "Debe ingresar un cliente"},  
		length: {minimum: 1, maximum: 7, :message => "El cliente debe tener entre 1 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

   def mayusculas
      self.numero.upcase!
   end

end