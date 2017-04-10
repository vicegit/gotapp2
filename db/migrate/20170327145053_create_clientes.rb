class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.integer :ci
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.date :fecha_contrato
      t.date :fecha_conexion
      t.string :observacion
      t.integer :medidor_id
      t.boolean :estado_cuenta

      t.timestamps
    end
  end
end
