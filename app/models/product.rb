class Product < ApplicationRecord

  belongs_to :genre
  belongs_to :user
  has_many :buy_list_products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image

  validates :name, presence: true

  def favorited_by?(user)
    Favorite.where(user_id: user.id).exists?
  end

end
