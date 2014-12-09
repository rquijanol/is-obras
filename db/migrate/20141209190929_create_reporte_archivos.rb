class CreateReporteArchivos < ActiveRecord::Migration
  def change
    create_table :reporte_archivos do |t|
      t.string :nombre
      t.string :path
      t.integer :tipo
      t.references :reporte, index: true

      t.timestamps
    end
  end
end
