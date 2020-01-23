class ProductsController < ApplicationController

  require 'payjp'

  #商品詳細ページ
  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.users_id)
    @category = Category.find(@product.category_id)
    @shipping = Shipping.find_by(product_id: params[:id])
    @product_image = ProductsImage.find_by(product_id: params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def buy
    @user = User.find(params[:id])
    @product = Product.find(params[:id])
    @address = Address.find(params[:id])
    @product_image = ProductsImage.find_by(product_id: params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def pay
    @product = Product.find(params[:id])
    @card = Card.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id, 
    currency: 'jpy',
    )
    redirect_to action: 'done' 
  end

  def done
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