class CreateDetallefacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :detallefacturas do |t|
      t.integer :factura_id
      t.integer :servicio_id
      t.integer :subtotal, :default => 0

      t.timestamps
    end
  end
end
