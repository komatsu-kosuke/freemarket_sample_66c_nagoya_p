class ProductsController < ApplicationController

  require 'payjp'

  def new
    @product = Product.new
    @product.build_shipping
    @product.products_images.build
    
  end

  def create
    Product.create(product_params)
  end

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
    card = Card.find_by(user_id: current_user.id)
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

  def destroy
    ActiveRecord::Base.transaction do
      @product = Product.find(params[:id])
      @product_image = ProductsImage.find_by(product_id: params[:id])
      @shipping = Shipping.find_by(product_id: params[:id])
      if @product_image.destroy && @shipping.destroy && @product.destroy
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
    @shipping = Shipping.find_by(product_id: params[:id])
    @product_image = ProductsImage.find_by(product_id: params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  private
  def shipping_params
    params.require(:shipping).permit( :period_before_shipping,
                                      :prefecture_form,
                                      :fee_burdun                                    
                                      ).merge(users_id: current_user.id)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :status, :users_id, :category_id, :brand_id, :size_id, shipping_attributes:[:fee_burden, :prefecture_from, :period_before_shipping, :_destroy], products_images_attributes:[:image, :_destroy]).merge(users_id: current_user.id)
  end

end