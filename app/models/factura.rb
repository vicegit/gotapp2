class Factura < ApplicationRecord
	before_save :mayusculas

   def mayusculas
      self.condicion.upcase!
   end
end
