class Periodo < ApplicationRecord

	has_many :lecturas
	has_many :facturas

end