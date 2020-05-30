class Users::BuyListProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy_list_product, only: [:edit, :update, :destroy]


  def create
    @buy_list_product = BuyListProduct.new(buy_list_product_params)
    @buy_list_product.save
    flash[:notice] = "買い物リストに追加しました"
    redirect_back(fallback_location: root_path)
  end

  def update
    @buy_list_product.update(buy_list_product_params)
    redirect_back(fallback_location: root_path)
    # 元のページへリダイレクト
  end

  def destroy
    @buy_list_product.destroy
    redirect_to users_buy_list_path(@buy_list_product), notice: "買い物リストを削除しました"
  end

  private

  def set_buy_list_product
    @buy_list_product = BuyListProduct.find(params[:id])
  end

  def buy_list_product_params
    params.require(:buy_list_product).permit(:buy_list_id, :product_id, :amount, :last_buy, :last_amount, :cost, :dead_line)
  end

end
