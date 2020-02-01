class SignupController < ApplicationController

  # STEP1 登録方法
#   def index
#   end

#   # STEP2 個人情報入力
#   def registration
#     @user = User.new
#   end

#   # STEP3 電話番号入力画面
#   def sms
#     binding.pry
#     session[:nickname] = user_params[:nickname]
#     session[:email] = user_params[:email]
#     session[:password] = user_params[:password]
#     session[:encrypted_password] = user_params[:encrypted_password]
#     session[:familyname] = user_params[:familyname]
#     session[:firstname] = user_params[:firstname]
#     session[:familyname_kana] = user_params[:familyname_kana]
#     session[:firstname_kana] = user_params[:firstname_kana]
#     session[:birthyear] = user_params[:birthyear]
#     session[:birthmonth] = user_params[:birthmonth]
#     session[:birthday] = user_params[:birthday]
#     @user = User.new( 
#       nickname: session[:nickname],
#       email: session[:email],
#       password: session[:password],
#       encrypted_password: session[:encrypted_password],
#       familyname: session[:familyname],
#       firstname: session[:firstname],
#       familyname_kana: session[:familyname_kana],
#       firstname_kana: session[:firstname_kana],
#       birthyear: session[:birthyear],
#       birthmonth: session[:birthmonth],
#       birthday: session[:birthday],
#       phonenumber: "09000000000"
#     )
#     render '/signup/registration' unless @user.valid?
#   end

#   # STEP4 住所入力
#   def adress
#     session[:phonenumber] = user_params[:phonenumber]
#     @user = User.new( 
#       nickname: session[:nickname],
#       email: session[:email],
#       password: session[:password],
#       encrypted_password: session[:encrypted_password],
#       familyname: session[:familyname],
#       firstname: session[:firstname],
#       familyname_kana: session[:familyname_kana],
#       firstname_kana: session[:firstname_kana],
#       birthyear: session[:birthyear],
#       birthmonth: session[:birthmonth],
#       birthday: session[:birthday],
#       phonenumber: session[:phonenumber]
#     )
#     @address = Address.new
#     render '/signup/sms' unless @user.valid?
#   end

#   # STEP5 登録完了画面
#   def create
#     @user = User.new( 
#       nickname: session[:nickname],
#       email: session[:email],
#       password: session[:password],
#       phonenumber: session[:phonenumber],
#       encrypted_password: session[:encrypted_password],
#       familyname: session[:familyname],
#       firstname: session[:firstname],
#       familyname_kana: session[:familyname_kana],
#       firstname_kana: session[:firstname_kana],
#       birthyear: session[:birthyear],
#       birthmonth: session[:birthmonth],
#       birthday: session[:birthday],
#       phonenumber: session[:phonenumber]
#     )

#     @user.save
#     @user_id = User.last
#     @address = Address.new(address_params)
#     @address.save
#     sign_in(:user, @user)
#     render '/signup/adress' unless @address.valid?
#   end
  
#   private

#   def user_params
#     params.require(:user).permit(
#       :nickname,
#       :email,
#       :password,
#       :password_confirmation,
#       :phonenumber,
#       :encrypted_password,
#       :familyname,
#       :firstname,
#       :familyname_kana,
#       :firstname_kana,
#       :birthyear,
#       :birthmonth,
#       :birthday
#     )
#   end

#   def address_params
#     params.require(:address).permit(
#       :zipcode,
#       :prefecture,
#       :city,
#       :district,
#       :building,
#     ).merge(user_id: @user_id.id)
#   end
# end
end