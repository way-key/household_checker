class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.all
  end

  def create
    product = Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: product.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    product = Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: product.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
