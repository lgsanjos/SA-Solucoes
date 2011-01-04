class SubCategoriasController < ApplicationController
  # GET /sub_categorias
  # GET /sub_categorias.xml
  def index
    @sub_categorias = SubCategoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categorias }
    end
  end

  # GET /sub_categorias/1
  # GET /sub_categorias/1.xml
  def show
    @sub_categoria = SubCategoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_categoria }
    end
  end

  # GET /sub_categorias/new
  # GET /sub_categorias/new.xml
  def new
    @sub_categoria = SubCategoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_categoria }
    end
  end

  # GET /sub_categorias/1/edit
  def edit
    @sub_categoria = SubCategoria.find(params[:id])
  end

  # POST /sub_categorias
  # POST /sub_categorias.xml
  def create
    @sub_categoria = SubCategoria.new(params[:sub_categoria])

    respond_to do |format|
      if @sub_categoria.save
        format.html { redirect_to(@sub_categoria, :notice => 'SubCategoria was successfully created.') }
        format.xml  { render :xml => @sub_categoria, :status => :created, :location => @sub_categoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_categorias/1
  # PUT /sub_categorias/1.xml
  def update
    @sub_categoria = SubCategoria.find(params[:id])

    respond_to do |format|
      if @sub_categoria.update_attributes(params[:sub_categoria])
        format.html { redirect_to(@sub_categoria, :notice => 'SubCategoria was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_categoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categorias/1
  # DELETE /sub_categorias/1.xml
  def destroy
    @sub_categoria = SubCategoria.find(params[:id])
    @sub_categoria.destroy

    respond_to do |format|
      format.html { redirect_to(sub_categorias_url) }
      format.xml  { head :ok }
    end
  end
end
