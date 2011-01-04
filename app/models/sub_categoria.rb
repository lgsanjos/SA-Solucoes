class SubCategoria < ActiveRecord::Base
   belongs_to :categoria
   has_one :produto
end
