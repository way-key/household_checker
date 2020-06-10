class Users::UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!


  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_user_path(@user), notice:"会員情報が変更されました"
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash[:notice] = "別会員ページのため、アクセス権がありません"
      redirect_back(fallback_location: root_path)
      # ログイン中会員とページURLの会員idが一致しない場合、元のページへリダイレクト
    end
  end

  def user_params
    params.require(:user).permit(:email, :user_id, :image, :name, :name_kana, :nickname)
  end

end
