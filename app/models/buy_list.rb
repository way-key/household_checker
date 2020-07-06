class BuyList < ApplicationRecord

  belongs_to :user
  has_many :buy_list_products, dependent: :destroy

  # ユーザーが作成できる買い物リスト名は空欄にできない + 一意性を設定
  validates :title, presence: true, uniqueness: { scope: :user_id }

end
