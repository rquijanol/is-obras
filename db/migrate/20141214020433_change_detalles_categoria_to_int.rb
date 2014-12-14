class ChangeDetallesCategoriaToInt < ActiveRecord::Migration
  def change
     remove_column :reporte_detalles, :categoria, :string
     add_column :reporte_detalles, :categoria, :integer
  end
end
