class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :product

  def favorited_by?(user)
    Favorite.where(user_id: user.id).exists?
  end

end
