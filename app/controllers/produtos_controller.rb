class ProdutosController < ApplicationController

  before_filter :check_permission, :except => [:index, :show]

  # GET /produtos
  # GET /produtos.xml
  def index
    logger.debug "Solicitando INDEX"

    if params[:pagina] && params[:pagina].to_i > 0
      @pagina = params[:pagina]
    else
      @pagina = 1    
    end
    logger.debug "@pagina = " + @pagina.to_s


    @selSubCat = (params[:subcategorias]) ? params[:subcategorias] : 'pagina'
    @selCat = (params[:categorias]) ? params[:categorias] : 'pagina'

    logger.debug "@selectedSubCat = " + @selSubCat.to_s
    logger.debug "@selectedCat = " + @selCat.to_s

    @produtos = Produto.find(:all,
                             :joins => [:sub_categoria, :categoria],
                             :conditions => [
                                              ' categorias.nome LIKE ? AND sub_categorias.nome LIKE ?',
                                              '%'+params[:categorias].to_s+'%', '%'+params[:subcategorias].to_s+'%'
                                            ],
                             :offset => ((@pagina.to_i - 1) * 5),
                             :limit => 5
                            )

    @totPag = Produto.count_by_sql(
                          "SELECT Count(`produtos`.id) FROM `produtos`
                                  INNER JOIN `sub_categorias` ON `sub_categorias`.id = `produtos`.sub_categoria_id 
                                  INNER JOIN `categorias` ON `categorias`.id = `produtos`.categoria_id
                                  WHERE ( categorias.nome LIKE '%#{params[:categorias]}%'
                                  AND sub_categorias.nome LIKE '%#{params[:subcategorias]}%')")
    @totPag = @totPag / 5
    @totPag = @totPag.next if @totPag % 5 > 0

    logger.debug "@totPag = " + @totPag.to_s
    @totPag = 1 if @totPag == 0


    @categorias = Categoria.all
    @subCategorias = SubCategoria.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @produtos }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.xml
  def show
    id = params[:id]

    if id.to_i > 0
      @produto = Produto.find(id)
    else
      @produto = Produto.find(:first, :conditions => [ 'nome like ?', '%' + id + '%'])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.xml
  def new
    @produto = Produto.new

    render :layout => false
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
    render :layout => false
  end

  # POST /produtos
  # POST /produtos.xml
  def create
    @produto = Produto.new(params[:produto])
    @produto.save

    redirect_to :action => :ger
  end

  # PUT /produtos/1
  # PUT /produtos/1.xml
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to(@produto, :notice => 'Produto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.xml
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to(produtos_url) }
      format.xml  { head :ok }
    end
  end

  def ger
    @produtos = Produto.find(:all)

    render :layout => false
  end
end
