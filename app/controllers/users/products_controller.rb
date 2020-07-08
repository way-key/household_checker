class Users::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search
  before_action :set_user, only: [:edit, :update, :destroy]

  def top

  end

  def new
    @product = Product.new
  end

  def index
    @products = @q.result(distinct: true).where(status: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @user = @product.user_id
    @buy_list_product = BuyListProduct.new
    @review = @product.reviews.new
    @reviews = @product.reviews.where(status: true).page(params[:page]).per(10).reverse_order
  end

  def edit

  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to users_products_path
    else
      flash.now[:alert] = '商品登録に失敗しました。内容に誤りがあります'
      render "new"
    end
  end

  def update
    if @product.update(product_params)
      redirect_to users_product_path(@product), notice: "商品情報が更新されました。"
    else
      flash.now[:alert] = '商品更新に失敗しました。内容に誤りがあります'
      render "edit"
    end
  end

    private

    def set_search
      @genres = Genre.where(status: true)
      @q = Product.ransack(params[:q])
    end

    def set_user
      @product = Product.find(params[:id])
      @user = @product.user
      if current_user.id != @user.id
        redirect_to users_products_path, alert: "作成者以外はアクセス権がありません。"
      end
    end

    def product_params
      params.require(:product).permit(:genre_id, :name, :image, :introduction, :jan_code, :user_id, :status)
    end

end
