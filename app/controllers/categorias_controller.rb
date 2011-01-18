class CategoriasController < ApplicationController

  before_filter :check_permission, :except => [:index, :show]
  
  # GET /categorias
  # GET /categorias.xml
  def index
    @categorias = Categoria.all

    render :layout => false
  end

  # GET /categorias/1
  # GET /categorias/1.xml
  def show
    @categoria = Categoria.find(params[:id])

    render :layout => false
  end

  # GET /categorias/new
  # GET /categorias/new.xml
  def new
    @categoria = Categoria.new

    render :layout => false
  end

  # GET /categorias/1/edit
  def edit
    @categoria = Categoria.find(params[:id])
    render :layout => false
  end

  # POST /categorias
  # POST /categorias.xml
  def create
    @categoria = Categoria.new(params[:categoria])

    @categoria.save
    render :layout => false
  end

  # PUT /categorias/1
  # PUT /categorias/1.xml
  def update
    @categoria = Categoria.find(params[:id])

    @categoria.update_attributes(params[:categoria])
    render :layout => false
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.xml
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    render :layout => false
  end
end
