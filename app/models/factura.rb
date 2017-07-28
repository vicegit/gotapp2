class Factura < ApplicationRecord

	belongs_to :cliente
	belongs_to :periodo
	has_many :detallefacturas
  	has_many :servicios, through: :detallefacturas
	before_save :mayusculas

	#Validaciones de cliente_id
	validates :cliente_id, :presence => {:message => "Debe ingresar un cliente"}, 
		length: {minimum: 1, maximum: 7, :message => "La cliente debe tener entre 1 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de periodo_id
	validates :periodo_id, :presence => {:message => "Debe ingresar un periodo"}, 
		length: {minimum: 1, maximum: 7, :message => "El periodo debe tener entre 1 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de condición
	validates :condicion, :presence => {:message => "Debe ingresar una condición"}, 
		length: {minimum: 3, maximum: 7, :message => "La condición debe tener entre 3 y 7 caracteres"}

	#Validaciones de fecha
	validates :fecha, :presence => {:message => "Debe ingresar una fecha"}, 

	#Validaciones de iva
	validates :iva, :presence => {:message => "Debe ingresar un iva"}, 
		length: {minimum: 3, maximum: 7, :message => "El iva debe tener entre 3 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de erssan
	validates :erssan, :presence => {:message => "Debe ingresar un erssan"}, 
		length: {minimum: 3, maximum: 7, :message => "El erssan debe tener entre 3 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

	#Validaciones de total
	validates :total, :presence => {:message => "Debe ingresar un total"}, 
		length: {minimum: 3, maximum: 7, :message => "El total debe tener entre 3 y 7 caracteres"}, 
		:numericality => {:only_integer => true, :message => "Debe ingresar un número entero"}

   def mayusculas
      self.condicion.upcase!
   end

end