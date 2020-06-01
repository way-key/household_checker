class Review < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  # 属性は数字のみ(1以上〜5以下)と制限

end
