class CreatePagos < ActiveRecord::Migration[5.0]
  def change
    create_table :pagos do |t|
      t.integer :factura_id
      t.date :fechapago
      t.integer :monto

      t.timestamps
    end
  end
end
