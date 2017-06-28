class Cliente < ApplicationRecord

	has_many :lecturas
	has_many :facturas
	has_many :ctacteclis
	has_one :medidor
	before_save :mayusculas
	after_save :generarctactecli

	private
   		def mayusculas
      		self.nombre.upcase!
      		self.direccion.upcase!
      		self.observacion.upcase!
   		end

   		def generarctactecli
   			ActiveRecord::Base.connection.execute("CALL generarctactecli")
		end

end