json.extract! servicio, :id, :concepto, :m3, :tarifa, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)
