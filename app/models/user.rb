class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :buy_lists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :name_kana, presence: true,
                format: {
                  with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                  message: "は全角カタカナのみで入力して下さい"
                }
  validates :nickname, presence: true

end
