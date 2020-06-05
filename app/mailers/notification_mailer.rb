class NotificationMailer < ApplicationMailer
  def send_when_check
    @check_buy_list = BuyListProducts.where(dead_line: 3.days.since)
    if @check_buy_list.present?
      mail to: @check_buy_list.buy_lists.users.email,
      subject: "買い物リスト商品の期限が近づいてきました"
    end
  end

  def send_when_test
    @check_buy_list = BuyListProducts.where(dead_line: Date.today)
    if @check_buy_list.present?
      mail to: "45gqz7@gmail.com",
      subject: "買い物リスト商品の期限が近づいてきました"
    end
    p "メール送信"
  end
end
