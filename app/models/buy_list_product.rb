class BuyListProduct < ApplicationRecord

  belongs_to :buy_list
  belongs_to :product

end
