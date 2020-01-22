class AccountsController < ApplicationController

  def index
  end

  def listing
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
    @address.update(address_params)
    redirect_back(fallback_location: root_path)
  end
  
  private 
  def address_params
    params.require(:address).permit(:zipcode, :prefecture, :city, :district, :building)
  end

end
