class CreatePedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :pedidos do |t|
      t.integer :numero_pedido
      t.references :clientes, foreign_key: true
      t.float :valor_total
      t.datetime :data_hora
      t.timestamps
    end
  end
end
