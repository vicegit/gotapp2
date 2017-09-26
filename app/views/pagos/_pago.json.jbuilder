json.extract! pago, :id, :factura_id, :fechapago, :monto, :created_at, :updated_at
json.url pago_url(pago, format: :json)
