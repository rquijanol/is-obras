class AddDescripcionToEmpresa < ActiveRecord::Migration
  def change
     add_column :empresas, :descripcion, :text
     rename_column :empresas, :name, :nombre
  end
end
