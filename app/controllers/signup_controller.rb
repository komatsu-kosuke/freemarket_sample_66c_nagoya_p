class SignupController < ApplicationController

  # STEP1 登録方法
  def index
  end

  def registration
    @user = User.new
  end

end
