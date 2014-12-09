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

ActiveRecord::Schema.define(version: 20141209190929) do

  create_table "empresas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "reporte_archivos", force: true do |t|
    t.string   "nombre"
    t.string   "path"
    t.integer  "tipo"
    t.integer  "reporte_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reporte_archivos", ["reporte_id"], name: "index_reporte_archivos_on_reporte_id"

  create_table "reporte_detalles", force: true do |t|
    t.string   "categoria"
    t.integer  "numeropersonas"
    t.integer  "reporte_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
