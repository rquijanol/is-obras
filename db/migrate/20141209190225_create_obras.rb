class CreateObras < ActiveRecord::Migration
  def change
    create_table :obras do |t|
      t.string :nombre
      t.float :importe
      t.integer :plazo
      t.date :fechainicial
      t.date :fechafinal
      t.references :empresa, index: true

      t.timestamps
    end
  end
end
