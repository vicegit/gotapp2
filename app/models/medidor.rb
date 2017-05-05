class Medidor < ApplicationRecord
	before_save :mayusculas

   def mayusculas
      self.numero.upcase!
   end
end
