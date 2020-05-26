class Product < ApplicationRecord

  belongs_to :genre
  has_many :buy_list_products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image

end
