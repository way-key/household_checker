class Users::BuyListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy_list, only: [:show, :update, :destroy]

  def index
    @new_buy_list = BuyList.new
    @buy_lists = current_user.buy_lists.all
  end

  def show
    @buy_list = BuyList.find(params[:id])
    @buy_list_products = @buy_list.buy_list_products.all
  end

  def create
    @new_buy_list = current_user.buy_lists.new(buy_list_params)
    if @new_buy_list.save
      redirect_to users_buy_lists_path, notice: "新たな買い物リストを作成しました"
    else
      @buy_lists = current_user.buy_lists.all
      render "index"
    end

  end

  def update
    if @buy_list.update(buy_list_params)
      redirect_to users_buy_list_path(@buy_list), notice: "買い物リスト名を変更しました"
    else
      render "show"
    end

  end

  def destroy
    @buy_list.destroy
    redirect_to users_buy_lists_path, notice: "買い物リストを削除しました"
  end

  private

  def buy_list_params
    params.require(:buy_list).permit(:user_id, :title)
  end

  def set_buy_list
    @buy_list = BuyList.find(params[:id])
  end

end
