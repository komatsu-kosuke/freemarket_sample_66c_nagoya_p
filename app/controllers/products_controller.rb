class ProductsController < ApplicationController
  #商品編集ページ
  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.users_id)
    @category = Category.find(@product.category_id)
    @shiping = Shipping.find(@product.id)
  
  end
end

# private

#   def shipping_params
#     params.require(:shipping).permit( :period_before_shipping,
#                                       :prefecture_form,
#                                       :fee_burdun                                    
#                                       ).merge(users_id: current_user.id)
#   end