class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)

    if user.save
      redirect_to admin_users_path, notice: "ユーザー「#{user.name}」を登録しました。"
    else
      render :new
    end

  end

  def user_param
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
  
end
