class CreateCtacteclis < ActiveRecord::Migration[5.0]
  def change
    create_table :ctacteclis do |t|
      t.integer :cliente_id
      t.boolean :estado_cuenta, :default => true
      t.integer :saldo, :default => 0

      t.timestamps
    end
  end
end
