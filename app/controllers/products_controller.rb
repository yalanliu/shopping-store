class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.available
    @products = Product.order(params[:order_by]) if params[:order_by]
  end

  def show
  end

  private
  
  def set_product
    @product = Product.find(params[:id])
  end
end
