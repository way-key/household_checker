class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :path_referer, only: [:edit, :destroy]

  def top
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def search
    @user = User.find(params[:id])
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).where(user_id: @user).page(params[:page]).per(20)
  end

  def edit
    @product = Product.find(params[:id])
    # searchアクションからの遷移で変数を追加
    if path[:action] == "search"
      @user = @product.user_id
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品：#{@product.name}　が編集されました。"
      # params[:select_user]の有無でリダイレクト先を選択
      if params[:select_user].present?
        redirect_to admins_products_search_path(@product.user)
      else
        redirect_to admins_products_path
      end
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "商品：#{@product.name}　が削除されました。"
    # 遷移元によってリダイレクト先を選択
    if path[:action] == "index"
      redirect_to admins_products_path
    else
      redirect_to admins_products_search_path(@product.user)
    end
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :image, :introduction, :jan_code, :status)
  end

  # 遷移元によってリダイレクト先を選択
  def path_referer
    path = Rails.application.routes.recognize_path(request.referer)
  end

end
