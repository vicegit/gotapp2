class Pago < ApplicationRecord

	belongs_to :factura

	#Validaciones de factura_id
	validates :factura_id, :presence => {:message => "Debe ingresar un factura"}, 
		:uniqueness => {:message => "La factura ya está registrada"}, 
		length: {minimum: 1, maximum: 8, :message => "La factura debe tener entre 1 y 8 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}
	
	#Validaciones de fechapago
	validates :fechapago, :presence => {:message => "Debe ingresar una fecha de pago"}

end