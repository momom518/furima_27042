class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :delivery
    belongs_to_active_hash :postage
    belongs_to_active_hash :prefecture
    has_one_attached :image
    belongs_to :user

    with_options presence: true do
      validates :user_id
      validates :name
      validates :image
      validates :information
      validates :prefecture
      validates :category_id, numericality: { other_than: 1 }
      validates :condition_id, numericality: { other_than: 1 }
      validates :delivery_id, numericality: { other_than: 1 }
      validates :price
    end
end