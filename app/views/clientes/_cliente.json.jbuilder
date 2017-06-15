json.extract! cliente, :id, :ci, :nombre, :direccion, :telefono, :fecha_contrato, :fecha_conexion, :observacion, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
