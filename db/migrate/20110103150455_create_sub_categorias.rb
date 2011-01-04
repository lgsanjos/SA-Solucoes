class CreateSubCategorias < ActiveRecord::Migration
  def self.up
    create_table :sub_categorias do |t|
      t.string :nome
      t.string :descricao
      t.references :categoria
      t.timestamps
    end
  end

  def self.down
    drop_table :sub_categorias
  end
end
