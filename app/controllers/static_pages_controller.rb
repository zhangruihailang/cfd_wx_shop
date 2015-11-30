class StaticPagesController < ApplicationController
  def home
    #if logged_in?
    #@micropost = current_user.microposts.build
    #@feed_items = current_user.feed.paginate(page: params[:page])
    #@feed_items = current_user.feed.paginate(page: params[:page])
    
    #end
    @projects = Project.all
    @code = params[:code]
    p "---------------------@code=#{@code}-------------------------------"
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def goods
    @page_num = 0
    if params[:page_num]
      @page_num =  params[:page_num]
    end
    page_size = 4
    @total_page = ((Product.count(:id).to_i - 1)/page_size )+1
    @products = Product.order("updated_at").limit(page_size).offset(@page_num.to_i * page_size.to_i)
    
    p "-----------------------page_num=#{@page_num}--------------------------------------"
    p "-----------------------total_page=#{@total_page}--------------------------------------"
  end
  
  def goods_zhekou_mobile
    # @page_num = 0
    # if params[:page_num]
    #   @page_num =  params[:page_num]
    # end
    # page_size = 20
    # @total_page = ((Product.count(:id).to_i - 1)/page_size )+1
    # @products = Product.order("updated_at").limit(page_size).offset(@page_num.to_i * page_size.to_i)
    
    # p "-----------------------page_num=#{@page_num}--------------------------------------"
    # p "-----------------------total_page=#{@total_page}--------------------------------------"
    @category = Category.find_by(:name => '名酒折扣')
    @products = @category.products
  end
  
  def goods_temai_mobile
    # @page_num = 0
    # if params[:page_num]
    #   @page_num =  params[:page_num]
    # end
    # page_size = 20
    # @total_page = ((Product.count(:id).to_i - 1)/page_size )+1
    # @products = Product.order("updated_at").limit(page_size).offset(@page_num.to_i * page_size.to_i)
    
    # p "-----------------------page_num=#{@page_num}--------------------------------------"
    # p "-----------------------total_page=#{@total_page}--------------------------------------"
    @category = Category.find_by(:name => '清仓特卖')
    @products = @category.products
  end
  
  def cart
    
  end
end
