class CreateLecturas < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturas do |t|
      t.integer :cliente_id
      t.integer :periodo_id
      t.date :fecha
      t.string :numero
      t.string :lector
      t.integer :actual
      t.integer :consumo
      t.integer :exceso

      t.timestamps
    end
  end
end
