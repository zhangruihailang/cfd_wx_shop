class ProductController < ApplicationController
  def index
    @good = Product.find(params[:id])
    @good.good_reads.create()
  end
end
