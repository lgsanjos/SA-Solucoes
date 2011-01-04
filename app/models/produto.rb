class Produto < ActiveRecord::Base
  has_many :imagems

  belongs_to :categoria
  belongs_to :sub_categoria
end
