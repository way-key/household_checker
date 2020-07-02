class Admins::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(20)
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
