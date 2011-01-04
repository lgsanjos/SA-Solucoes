class Categoria < ActiveRecord::Base
  has_many :sub_categoria
  has_many :produto
end
