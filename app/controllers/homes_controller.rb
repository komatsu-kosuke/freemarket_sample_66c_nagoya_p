class HomesController < ApplicationController

  def index
    # @products_image.image="#{@product.id}.jpg"
    # image=params[:image_file]
    # File.binwrite("public/#{@user.image_name}", image.read)
  end

  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  # def update
  #   @user = Users.find(params[:id])
  #   user.update(user_params)
  #   redirect_to root_path
  # end


  def profile
    # @user = User.find(user_params)
  end
  
  # private 
  # def user_params
  #   params.require(:user).permit(:nickname, :email, :firstname, :familyname, :firstname_kana, :familyname_kana, :descript, :birthyaer, :birthmonth, :birthday, :phonenumber)
  # end
end
