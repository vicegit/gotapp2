class Medidor < ApplicationRecord

	belongs_to :cliente
	before_save :mayusculas

   def mayusculas
      self.numero.upcase!
   end

end