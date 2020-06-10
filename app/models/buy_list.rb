class BuyList < ApplicationRecord

  belongs_to :user
  has_many :buy_list_products, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :user_id }
  # ユーザーが作成できる買い物リスト名は空欄では無い + 一意性を設定

end
