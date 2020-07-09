class Admins::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Review.ransack(params[:q])
    # params[:user_id]の有無で変数を分ける
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @reviews = @q.result(distinct: true).where(user_id: @user).page(params[:page]).per(20)
    else
      @reviews = @q.result(distinct: true).page(params[:page]).per(20)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    flash[:notice] = "コメントステータスを変更しました"
    # params[:user_id]を持って来ていれば、遷移先(index)にそのまま返す
    if params[:user_id].present?
      user_id = params[:user_id]
      redirect_to admins_reviews_path(user_id: user_id)
    else
      redirect_to admins_reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:status)
  end

end
