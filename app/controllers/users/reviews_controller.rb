class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = current_user.reviews.new(review_params)
      if @review.save
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = '評価：星の数を選択してください'
        redirect_back(fallback_location: root_path)
      end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :score, :comment)
  end

end
