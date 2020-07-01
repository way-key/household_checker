class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.page(params[:page]).per(20)
  end

  def create
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    @favorites = current_user.favorites.page(params[:page]).per(20)
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end

end
