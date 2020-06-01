class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :product

  def product_by?(user)
    Favorite.where(user_id: user.id).exists?
  end

end
