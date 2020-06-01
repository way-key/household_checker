class Users::ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.new(review_params)
      if @review.save
        redirect_back(fallback_location: root_path)
      else
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
