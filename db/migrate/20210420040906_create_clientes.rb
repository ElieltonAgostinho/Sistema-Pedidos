class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone
      t.datetime :data
      t.timestamps
    end
  end
end
