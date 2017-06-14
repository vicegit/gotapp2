class Servicio < ApplicationRecord

	has_many :detallefacturas
  	has_many :facturas, through: :detallefacturas
	before_save :mayusculas

   def mayusculas
      self.concepto.upcase!
   end

end