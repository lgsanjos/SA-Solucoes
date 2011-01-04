class ImagemsController < ApplicationController
  # GET /imagems
  # GET /imagems.xml
  def index
    @imagems = Imagem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imagems }
    end
  end

  # GET /imagems/1
  # GET /imagems/1.xml
  def show
    @imagem = Imagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @imagem }
    end
  end

  # GET /imagems/new
  # GET /imagems/new.xml
  def new
    @imagem = Imagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imagem }
    end
  end

  # GET /imagems/1/edit
  def edit
    @imagem = Imagem.find(params[:id])
  end

  # POST /imagems
  # POST /imagems.xml
  def create

    @imagem = Imagem.new()
    @imagem.titulo = params[:imagem][:titulo]
    @imagem.produto = Produto.find(params[:imagem][:produto_id])
    @imagem.caminho = params[:imagem][:caminho]

    respond_to do |format|
      #if Imagem.save_file(params[:imagem]) and @imagem.save
      if @imagem.save
        format.html { redirect_to(@imagem, :notice => 'Imagem was successfully created.') }
        format.xml  { render :xml => @imagem, :status => :created, :location => @imagem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imagems/1
  # PUT /imagems/1.xml
  def update
    @imagem = Imagem.find(params[:id])

    respond_to do |format|
      if @imagem.update_attributes(params[:imagem])
        format.html { redirect_to(@imagem, :notice => 'Imagem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imagems/1
  # DELETE /imagems/1.xml
  def destroy
    @imagem = Imagem.find(params[:id])
    @imagem.destroy

    respond_to do |format|
      format.html { redirect_to(imagems_url) }
      format.xml  { head :ok }
    end
  end

end
