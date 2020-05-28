class Users::BuyListProductsController < ApplicationController

  def create

  end

  def update
    @buy_list_product = BuyListProduct.find(params[:id])
    @buy_list_product.update(buy_list_product_params)
    redirect_back(fallback_location: root_path)
    # 元のページへリダイレクト
  end

  def destroy
    @buy_list_product = BuyListProduct.find(params[:id])
    @buy_list_product.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def buy_list_product_params
    params.require(:buy_list_product).permit(:buy_list_id)
  end

end
