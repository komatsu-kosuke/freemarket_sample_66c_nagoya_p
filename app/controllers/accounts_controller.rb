class AccountsController < ApplicationController

  def index
  end

  def listing
    @product = Product.where(users_id: current_user.id).order(created_at: "DESC").limit(5)
  end

  def listing_progress
  end

  def completed
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.find(params[:id])
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
