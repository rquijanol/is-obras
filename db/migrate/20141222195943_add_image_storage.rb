class AddImageStorage < ActiveRecord::Migration
  def change
    add_column :reporte_archivos, :image_uid, :string
  end
end
