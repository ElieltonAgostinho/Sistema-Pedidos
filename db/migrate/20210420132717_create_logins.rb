class CreateLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :logins do |t|
      t.references :clientes, foreign_key: true
      t.string :login
      t.string :senha
      t.timestamps
    end
  end
end
