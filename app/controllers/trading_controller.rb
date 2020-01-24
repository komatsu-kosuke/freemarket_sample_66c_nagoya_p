class TradingController < ApplicationController

  def new
    @product = Product.new
    @product.build_shipping
    @product.products_images.build
  end


  def create
    Product.create(product_params)
  end


  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :status, :users_id, :category_id, :brand_id, :size_id, shipping_attributes:[:fee_burden, :prefecture_from, :period_before_shipping], products_images_attributes:[:image]).merge(users_id: current_user.id)
  end
end
