class Servicio < ApplicationRecord
	before_save :mayusculas

   def mayusculas
      self.concepto.upcase!
   end
end
