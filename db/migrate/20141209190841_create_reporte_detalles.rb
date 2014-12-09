class CreateReporteDetalles < ActiveRecord::Migration
  def change
    create_table :reporte_detalles do |t|
      t.string :categoria
      t.integer :numeropersonas
      t.references :reporte, index: true

      t.timestamps
    end
  end
end
