class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = current_user.reviews.new(review_params)
    @product = Product.find(params[:review][:product_id])
    @reviews = @product.reviews.where(status: true).page(params[:page]).per(10).reverse_order
    if @review.comment.present? || @review.score.blank?
      @review.score = comment_check
    end
    @review.save
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

  # Google Natural Language APIの点数を基に、スコアの点数を決める
  def comment_check
    case Language.get_data(review_params[:comment])
    when -1.0..-0.6
      1
    when -0.5..-0.2
      2
    when -0.1..0.1
      3
    when 0.2..0.5
      4
    when 0.6..1.0
      5
    end
  end

end
