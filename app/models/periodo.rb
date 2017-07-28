class Periodo < ApplicationRecord

	has_many :lecturas
	has_many :facturas

	#Validaciones de periodo
	validates :periodo, :presence => {:message => "Debe ingresar un periodo"}, 
		:uniqueness => {:message => "El periodo ya está registrado"}

	#Validaciones de fecha_vencimiento
		validates :fecha_vencimiento, :presence => {:message => "Debe ingresar una fecha de vencimiento"}

end