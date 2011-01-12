class ContatosController < ApplicationController

  def index
    @contato = Contato.new
  end

  def create
    if request.post?
      @contato = Contato.new(params[:contato])
      @contato.save
      flash[:notice] = "Mensagem enviada com sucesso!"
      redirect_to :action => "index"
    end
  end

  
end
