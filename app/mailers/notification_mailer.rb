class NotificationMailer < ApplicationMailer
  def send_when_check
    @check_dead_line = User.eager_load(buy_lists: :buy_list_products).where(buy_list_products: { dead_line: 3.days.since.strftime("%Y-%m-%d") })
    # 期限が迫った買い物リスト商品を持ってるユーザーを抽出
    if @check_dead_line.present?
      mail to: @check_dead_line.map(&:email).join(","),
      # 変数のユーザ全員を宛先
      subject: "買い物リスト商品の期限が近づいてきました"
    end
  end
end
