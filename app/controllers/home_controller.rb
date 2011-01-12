class HomeController < ApplicationController
  def index

    @produtos = Produto.find(:all,
                             :conditions => { :promocao => true },
                             :order => 'Rand()',
                             :limit => 9
                             )

    #@images = Imagem.find(:all, :conditions => [ 'produto_id in (?)', @produtos.collect(&:id) ])

    
  end

end
