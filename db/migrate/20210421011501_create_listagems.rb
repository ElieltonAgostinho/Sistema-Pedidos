class CreateListagems < ActiveRecord::Migration[6.1]
  def change
    create_table :listagems do |t|
      t.integer :numero_pedido
      t.references :produtos, foreign_key: true
      t.float :valor_pedido
      t.timestamps
    end
  end
end
