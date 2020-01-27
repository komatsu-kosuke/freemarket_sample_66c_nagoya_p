class HomesController < ApplicationController

  def index
    @product = Product.all.order(created_at: "DESC").limit(5)
    
    # @products_image.image="#{@product.id}.jpg"
    # image=params[:image_file]
    # File.binwrite("public/#{@user.image_name}", image.read)
    # 商品一覧のサーバーサイドは未実装のため
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    # サーバーサイド未実装のため
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_home_path
  end


  def profile
    @user = User.find(params[:id])
    # サーバーサイド未実装のため
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
