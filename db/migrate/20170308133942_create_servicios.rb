class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.string :concepto
      t.integer :m3
      t.integer :tarifa

      t.timestamps
    end
  end
end
