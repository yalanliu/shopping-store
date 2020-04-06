class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
    @products = Product.order(params[:order_by]) if params[:order_by]
  end

  def new
    @product = Product.new
  end

  def edit
    @product.images.attachments.find(params[:image_id]).delete if params[:image_id]
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '商品已新增成功!'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: '商品已修改成功!'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: '商品已刪除成功'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name,
                                      :description,
                                      :sku,
                                      :list_price, 
                                      :sell_price, 
                                      :stock, 
                                      :status,
                                      :user_id, 
                                      images: [])
    end
end
