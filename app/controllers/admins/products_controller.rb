class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

def top
end

def index
  @q = Product.ransack(params[:q])
  @products = @q.result(distinct: true).page(params[:page]).per(20)
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to admins_products_path, notice: "商品：#{@product.name}　が編集されました。"
  else

    render "edit"
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to admins_products_path, notice: "商品：#{@product.name}　が削除されました。"
end

private

def product_params
  params.require(:product).permit(:genre_id, :name, :image, :introduction, :jan_code, :status)
end

end
