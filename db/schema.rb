# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141222195943) do

  create_table "empresas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descripcion"
  end

  create_table "obras", force: true do |t|
    t.string   "nombre"
    t.float    "importe"
    t.integer  "plazo"
    t.date     "fechainicial"
    t.date     "fechafinal"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "obras", ["empresa_id"], name: "index_obras_on_empresa_id"

  create_table "photos", force: true do |t|
    t.string   "image_uid"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reporte_archivos", force: true do |t|
    t.string   "nombre"
    t.string   "path"
    t.integer  "tipo"
    t.integer  "reporte_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
  end

  add_index "reporte_archivos", ["reporte_id"], name: "index_reporte_archivos_on_reporte_id"

  create_table "reporte_detalles", force: true do |t|
    t.integer  "numeropersonas"
    t.integer  "reporte_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria"
  end

  add_index "reporte_detalles", ["reporte_id"], name: "index_reporte_detalles_on_reporte_id"

  create_table "reportes", force: true do |t|
    t.string   "clima"
    t.date     "fecha"
    t.text     "incidencias"
    t.text     "cambios"
    t.string   "residente"
    t.string   "supervisor"
    t.integer  "obra_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportes", ["obra_id"], name: "index_reportes_on_obra_id"

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.boolean  "done"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbs", force: true do |t|
    t.string   "uid"
    t.string   "job"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
