class Cliente < ApplicationRecord

	has_many :lecturas
	has_many :facturas
	has_many :ctacteclis
	has_one :medidor
	before_save :mayusculas
	after_save :generarctactecli

   def mayusculas
      self.nombre.upcase!
      self.direccion.upcase!
      self.observacion.upcase!
   end

   	def generarctactecli
   		#puts 'hola mundo'
		ActiveRecord::Base.connection.execute("CALL generarctactecli")
		#ActiveRecord::Base.connection.execute("CALL generarctactecli ('#{nombre}')")
	end

end