class NotificationMailer < ApplicationMailer
  def send_when_check
    @check_buy_list = BuyListProduct.where(dead_line: 3.days.since)
    @user = User.where(id: @check_buy_list.buy_list.user.id)
    if @check_buy_list.present?
      mail to: @user.map(&:email).join(", "),
      # 買い物リスト商品の中で、有効期限が三日前に迫ったユーザーが宛先
      subject: "買い物リスト商品の期限が近づいてきました"
    end
  end

end
