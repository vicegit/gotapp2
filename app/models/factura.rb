class Factura < ApplicationRecord

	belongs_to :cliente
	belongs_to :periodo
	has_many :detallefacturas
  	has_many :servicios, through: :detallefacturas
	before_save :mayusculas

   def mayusculas
      self.condicion.upcase!
   end

end