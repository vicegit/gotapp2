json.extract! factura, :id, :cliente_id, :periodo_id, :condicion, :fecha, :iva, :erssan, :total, :created_at, :updated_at
json.url factura_url(factura, format: :json)
