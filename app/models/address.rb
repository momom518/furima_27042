class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  # addressモデルのテストコード用の記述↓
  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  #   validates :prefecture_id
  #   validates :city
  #   validates :house_number
  #   validates :telephone_number, length: { maximum: 11 }
  # end
end
