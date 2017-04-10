json.extract! lectura, :id, :medidor_id, :periodo_id, :fecha, :lector, :actual, :consumo, :exceso, :created_at, :updated_at
json.url lectura_url(lectura, format: :json)
