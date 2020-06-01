class Admins::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page]).per(20).reverse_order
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to admins_reviews_path, notice: "コメントステータスを変更しました"
  end

  private

  def review_params
    params.require(:review).permit(:status)
  end

end
