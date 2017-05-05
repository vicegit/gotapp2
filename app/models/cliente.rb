class Cliente < ApplicationRecord
	before_save :mayusculas

   def mayusculas
      self.nombre.upcase!
      self.direccion.upcase!
      self.observacion.upcase!
   end
end
