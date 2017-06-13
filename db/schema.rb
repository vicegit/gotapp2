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

ActiveRecord::Schema.define(version: 20170327162443) do

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ci"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.date     "fecha_contrato"
    t.date     "fecha_conexion"
    t.string   "observacion"
    t.integer  "medidor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ctacteclis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.boolean  "estado_cuenta", default: true
    t.integer  "saldo",         default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "detallectacteclis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ctactecli_id"
    t.date     "fechadetalle"
    t.string   "tipodetalle"
    t.integer  "debe",         default: 0
    t.integer  "haber",        default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "detallefacturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "factura_id"
    t.integer  "servicio_id"
    t.integer  "subtotal",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "facturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.integer  "periodo_id"
    t.string   "condicion"
    t.date     "fecha"
    t.integer  "iva",        default: 0
    t.integer  "erssan",     default: 0
    t.integer  "total",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lecturas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cliente_id"
    t.integer  "periodo_id"
    t.date     "fecha"
    t.string   "lector"
    t.integer  "actual"
    t.integer  "consumo"
    t.integer  "exceso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medidors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "numero"
    t.integer  "medicion",       default: 0
    t.boolean  "estado_medidor", default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "periodos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "periodo"
    t.date     "fecha_vencimiento"
    t.boolean  "estado_periodo",    default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "servicios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "concepto"
    t.integer  "m3"
    t.integer  "tarifa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
