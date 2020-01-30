class HomesController < ApplicationController

  def index
    @product = Product.order(created_at: "DESC").limit(5)
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_home_path
  end


  def profile
    @user = User.find(params[:id])
  end

  def logout
  end

  def credit
  end

  def credit_register
  end

  def listings
  end

  def listing
  end
  
  private 
  def user_params
    params.require(:user).permit(:nickname, :description, :email, :firstname, :familyname, :firstname_kana, :familyname_kana, :descript, :birthyaer, :birthmonth, :birthday, :phonenumber)
  end
end
