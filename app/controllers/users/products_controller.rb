class Users::ProductsController < ApplicationController
  before_action :set_search

  def top

  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.where(status: true).page(params[:page]).per(5)
  end

  def search
    @products = @q.result(distinct: true).where(status: true).page(params[:page]).per(5)
    render "index"
  end

  def show

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to users_products_path
    else
      render "new"
    end
  end

  def update


  end

    private

    def set_search
      @genres = Genre.where(status: true)
      @q = Product.ransack(params[:q])
    end

    def product_params
      params.require(:product).permit(:genre_id, :name, :image, :introduction, :jan_code)
    end

end
