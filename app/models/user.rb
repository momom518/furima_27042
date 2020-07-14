class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_one :purchase
  has_one :card, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i }
    validates :birthday
  end
end
