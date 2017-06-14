class Medidor < ApplicationRecord

	has_one :cliente
	before_save :mayusculas

   def mayusculas
      self.numero.upcase!
   end

end