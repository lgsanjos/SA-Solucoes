class CreateContatos < ActiveRecord::Migration
  def self.up
    create_table :contatos do |t|
      t.string :nome, :length => 30
      t.string :nomeEmpresa, :length => 30
      t.string :email, :email => true, :length => 50
      t.string :telefone, :length => 20
      t.string :celular, :length => 20
      t.string :cidade, :length => 50
      t.string :endereco, :length => 50
      t.text :mensagem
      t.string :motivo, :length => 10
      t.timestamps
    end
  end

  def self.down
    drop_table :contatos
  end
end
