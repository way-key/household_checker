class Admins::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def search
    @user = User.find(params[:id])
    @q = Review.ransack(params[:q])
    @reviews = @q.result(distinct: true).where(user_id: @user).page(params[:page]).per(20)
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    flash[:notice] = "コメントステータスを変更しました"
    # 遷移元によってリダイレクト先を選択
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:action] == "index"
      redirect_to admins_reviews_path
    else
      redirect_to admins_reviews_search_path(@review.user)
    end
  end

  private

  def review_params
    params.require(:review).permit(:status)
  end



end
