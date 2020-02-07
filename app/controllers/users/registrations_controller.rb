# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  # STEP1 登録方法
  def new
    @user = User.new
  end

  # STEP2 個人情報入力
  def create
    @user = User.new(user_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    
    render "sms"
    # renderの謎を探る
  end

  # STEP3 電話番号入力画面
  def sms
  end

  # STEP4 住所入力
  def adress
    session["devise.regist_data"]["user"]["phonenumber"] = params[:user][:phonenumber]
    @user = User.new(user_params)
    @address = @user.build_address
  end

  def address_create
    @user = User.new(session["devise.regist_data"]["user"])
    
    @address = Address.new(address_params)
    @user.build_address(@address.attributes)
    @user.save!
    render 'adress' unless @address.valid?
    sign_in(:user, @user)
    
  end
  
  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :phonenumber,
      :encrypted_password,
      :familyname,
      :firstname,
      :familyname_kana,
      :firstname_kana,
      :birthyear,
      :birthmonth,
      :birthday
    )
  end

  def address_params
    params.require(:address).permit(
      :zipcode,
      :prefecture,
      :city,
      :district,
      :building,
    )
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname,
                                                        :email,
                                                        :password,
                                                        :password_confirmation,
                                                        :phonenumber,
                                                        :encrypted_password,
                                                        :familyname,
                                                        :firstname,
                                                        :familyname_kana,
                                                        :firstname_kana,
                                                        :birthyear,
                                                        :birthmonth,
                                                        :birthday])
  end
end