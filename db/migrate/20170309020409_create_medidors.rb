class CreateMedidors < ActiveRecord::Migration[5.0]
  def change
    create_table :medidors do |t|
      t.string :numero
      t.integer :medicion, :default => 0
      t.integer :cliente_id
      t.boolean :estado_medidor, :default => true

      t.timestamps
    end
  end
end
