class Ctactecli < ApplicationRecord

	belongs_to :cliente
	has_many :detallectacteclis

	#Validaciones de cliente_id
	validates :cliente_id, :presence => {:message => "Debe ingresar un cliente"}, 
		:uniqueness => {:message => "El cliente ya está registrado"}, 
		length: {minimum: 1, maximum: 7, :message => "El cliente debe tener entre 1 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}
	
	#Validaciones de saldo
	validates :saldo, :presence => {:message => "Debe ingresar un saldo"}, 
		length: {minimum: 1, maximum: 7, :message => "El saldo debe tener entre 1 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

end