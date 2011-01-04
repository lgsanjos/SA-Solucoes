class CreateImagems < ActiveRecord::Migration
  def self.up
    create_table :imagems do |t|
      t.string :titulo
      t.string :caminho
      t.references :produto
 
      t.timestamps
    end
  end

  def self.down
    drop_table :imagems
  end
end
