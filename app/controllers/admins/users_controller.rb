class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admins_users_path(@user), notice:"会員ステータスが変更されました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_id, :status)
  end

end
