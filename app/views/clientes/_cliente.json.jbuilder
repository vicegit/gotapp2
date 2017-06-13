json.extract! cliente, :id, :ci, :nombre, :direccion, :telefono, :fecha_contrato, :fecha_conexion, :observacion, :medidor_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
