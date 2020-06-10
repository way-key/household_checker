class NotificationMailer < ApplicationMailer
  def send_when_check
    @check_buy_list = BuyListProducts.where(dead_line: 3.days.since)
    if @check_buy_list.present?
      mail to: @check_buy_list.buy_lists.users.email,
      subject: "買い物リスト商品の期限が近づいてきました"
    end
  end

end
