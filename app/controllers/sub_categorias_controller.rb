class SubCategoriasController < ApplicationController

  before_filter :check_permission, :except => [:index, :show]
  
  # GET /sub_categorias
  # GET /sub_categorias.xml
  def index
    @sub_categorias = SubCategoria.all

    render :layout => false
  end

  # GET /sub_categorias/1
  # GET /sub_categorias/1.xml
  def show
    @sub_categoria = SubCategoria.find(params[:id])

    render :layout => false
  end

  # GET /sub_categorias/new
  # GET /sub_categorias/new.xml
  def new
    @sub_categoria = SubCategoria.new

    render :layout => false
  end

  # GET /sub_categorias/1/edit
  def edit
    @sub_categoria = SubCategoria.find(params[:id])
    render :layout => false
  end

  # POST /sub_categorias
  # POST /sub_categorias.xml
  def create
    @sub_categoria = SubCategoria.new(params[:sub_categoria])

    @sub_categoria.save
    render :layout => false
  end

  # PUT /sub_categorias/1
  # PUT /sub_categorias/1.xml
  def update
    @sub_categoria = SubCategoria.find(params[:id])
    @sub_categoria.update_attributes(params[:sub_categoria])
    render :layout => false
  end

  # DELETE /sub_categorias/1
  # DELETE /sub_categorias/1.xml
  def destroy
    @sub_categoria = SubCategoria.find(params[:id])
    @sub_categoria.destroy
    render :layout => false
  end
end
