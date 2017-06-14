class Ctactecli < ApplicationRecord

	belongs_to :cliente
	has_many :detallectacteclis

end