class NotificationMailer < ApplicationMailer
  def send_when_check
    # 期限が迫った買い物リスト商品を持ってるユーザーを抽出
    @check_dead_line = User.eager_load(buy_lists: :buy_list_products).where(buy_list_products: { dead_line: 3.days.since.strftime("%Y-%m-%d") })
    if @check_dead_line.present?
      # 変数のユーザ全員を宛先
      mail to: @check_dead_line.map(&:email).join(","),
      subject: "買い物リスト商品の期限が近づいてきました"
    end
  end
end
