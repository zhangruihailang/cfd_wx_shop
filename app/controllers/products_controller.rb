class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :is_admin_user
  skip_before_filter :verify_authenticity_token, :only => [:search_products]
  # GET /products
  # GET /products.json
  # def index
  #   # @products = Product.all
  # end
  
  
  def index
    @page_num = 0
    if params[:page_num]
      @page_num =  params[:page_num]
    end
    page_size = 25
    @total_page = ((Product.all.count(:id).to_i - 1)/page_size )+1
    @products = Product.all.order("updated_at desc").limit(page_size).offset(@page_num.to_i * page_size.to_i)
    
    Rails.logger.info "-----------------------page_num=#{@page_num}--------------------------------------"
    Rails.logger.info "-----------------------total_page=#{@total_page}--------------------------------------"
    
    #fresh_when(etag: [@channels])
    render 'index', :layout => 'admin'
  end
  
  def search_products
    @keyword = params[:keyword]
     @page_num = 0
    if params[:page_num]
      @page_num =  params[:page_num]
    end
    page_size = 25
    @total_page = ((Product.where("title like ? or name like ?", "%#{@keyword}%", "%#{@keyword}%").count(:id).to_i - 1)/page_size )+1
    @products = Product.where("title like ? or name like ?", "%#{@keyword}%", "%#{@keyword}%").order("updated_at desc").limit(page_size).offset(@page_num.to_i * page_size.to_i)
    
    Rails.logger.info "-----------------------page_num=#{@page_num}--------------------------------------"
    Rails.logger.info "-----------------------total_page=#{@total_page}--------------------------------------"
    
    #fresh_when(etag: [@channels])
    render 'index', :layout => 'admin'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render 'show', :layout => 'admin'
  end

  # GET /products/new
  def new
    @product = Product.new
    render 'new', :layout => 'admin'
  end

  # GET /products/1/edit
  def edit
    render 'edit', :layout => 'admin'
  end

  # POST /products
  # POST /products.json
  def create
    @category = Category.find(params[:category])
    if !@category.nil?
      # @product = Product.new(product_params)
      @product = @category.products.create(product_params)
      respond_to do |format|
        if @product.save
          format.html { redirect_to '/products', notice: '产品发布成功.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, :layout => 'admin'}
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.update_attributes(:category_id => params[:category])
        format.html { redirect_to '/products', notice: '产品修改成功.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit , :layout => 'admin'}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def delete_product
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '商品成功删除.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :title, :thumbnail, :promotion_price, :cost_price, :producing_area, :net_content, :factory, :alcoholic_strength, :specification, :specification_box, :store_condition, :flavour_type, :brand, :materials, :description)
    end
end
