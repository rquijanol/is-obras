class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.string :clima
      t.date :fecha
      t.text :incidencias
      t.text :cambios
      t.string :residente
      t.string :supervisor
      t.references :obra, index: true

      t.timestamps
    end
  end
end
