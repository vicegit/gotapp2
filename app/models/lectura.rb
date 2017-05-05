class Lectura < ApplicationRecord
	before_save :mayusculas

   def mayusculas
      self.lector.upcase!
   end
end
