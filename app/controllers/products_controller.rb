class ProductsController < ApplicationController
  #商品編集ページ
  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.users_id)
    @category = Category.find(@product.category_id)
    @shipping = Shipping.find_by(product_id: params[:id])
    @product_image = ProductsImage.find_by(product_id: params[:id])
    @prefecture = Prefecture.find_by(id: @shipping.prefecture_id)
  end

  def buy
    @product = Product.find(params[:id])
    @product_image = ProductsImage.find_by(product_id: params[:id])
  end

  private
  def shipping_params
    params.require(:shipping).permit( :period_before_shipping,
                                      :prefecture_form,
                                      :fee_burdun                                    
                                      ).merge(users_id: current_user.id)
  end
end