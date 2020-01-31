class AccountsController < ApplicationController

  def index
  end

  def listing
    @product = Product.where(users_id: current_user.id, progress: "出品中").order(created_at: "DESC").limit(10)
  end

  def listing_progress
    @product = Product.where(progress: "交渉中",buyer_id: current_user.id).order(created_at: "DESC").limit(10)
   
    # @product = Product.find(params[:id])
  end

  def completed
  end

  def edit
    @user = User.find(current_user.id)
    @address = Address.find(current_user.id)
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_back(fallback_location: root_path)
    else
      render '/accounts/edit' unless @address.valid?
    end
  end
  
  private 
  def address_params
    params.require(:address).permit(:zipcode, :prefecture, :city, :district, :building)
  end

end
