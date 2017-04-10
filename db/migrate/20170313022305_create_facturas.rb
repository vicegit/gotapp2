class CreateFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :facturas do |t|
      t.integer :cliente_id
      t.integer :periodo_id
      t.string :condicion
      t.date :fecha
      t.integer :iva, :default => 0
      t.integer :erssan, :default => 0
      t.integer :total, :default => 0

      t.timestamps
    end
  end
end
