class CreateMedidors < ActiveRecord::Migration[5.0]
  def change
    create_table :medidors do |t|
      t.string :numero
      t.integer :medicion
      t.boolean :estado_medidor

      t.timestamps
    end
  end
end
