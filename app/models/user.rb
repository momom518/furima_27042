class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness:true, length: { minimum: 6 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "＠を入れてください。"}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :firstname_kana, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
    validates :lastname_kana, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
    validates :password ,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i, message: "６文字以上の英数字を入れてください。"}
    validates :encrypted_password
    validates :birthday
  end      
end
