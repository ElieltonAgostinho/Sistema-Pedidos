# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_21_011501) do

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.datetime "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lista_pedidos", force: :cascade do |t|
    t.integer "numero_pedido"
    t.integer "produtos_id"
    t.float "valor_pedido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produtos_id"], name: "index_lista_pedidos_on_produtos_id"
  end

  create_table "listagems", force: :cascade do |t|
    t.integer "numero_pedido"
    t.integer "produtos_id"
    t.float "valor_pedido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produtos_id"], name: "index_listagems_on_produtos_id"
  end

  create_table "logins", force: :cascade do |t|
    t.integer "clientes_id"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clientes_id"], name: "index_logins_on_clientes_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "numero_pedido"
    t.integer "clientes_id"
    t.float "valor_total"
    t.datetime "data_hora"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clientes_id"], name: "index_pedidos_on_clientes_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.float "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "lista_pedidos", "produtos", column: "produtos_id"
  add_foreign_key "listagems", "produtos", column: "produtos_id"
  add_foreign_key "logins", "clientes", column: "clientes_id"
  add_foreign_key "pedidos", "clientes", column: "clientes_id"
end
