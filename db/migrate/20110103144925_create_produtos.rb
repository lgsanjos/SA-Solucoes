class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :nome
      t.string :titulo
      t.text :descricao
      t.string :linkFabricante
      t.string :marca
      t.string :modelo
      t.decimal :preco
      t.references :categoria
      t.references :sub_categoria
      t.boolean :promocao
      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
