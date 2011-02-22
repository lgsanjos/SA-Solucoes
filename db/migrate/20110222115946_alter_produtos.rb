class AlterProdutos < ActiveRecord::Migration
  def self.up
    add_column :produtos, :descricao_filename, :string, :size => 20
  end

  def self.down
    remove_column(:produtos, :descricao_filename)
  end
end
