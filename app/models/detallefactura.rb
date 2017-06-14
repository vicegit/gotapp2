class Detallefactura < ApplicationRecord

	belongs_to :factura
	belongs_to :servicio

end