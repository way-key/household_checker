class BuyList < ApplicationRecord

  belongs_to :user
  has_many :buy_list_products, dependent: :destroy

end
