class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :title, presence: true

  def product_by?(user)
    Favorite.where(user_id: user.id).exists?
  end

end
