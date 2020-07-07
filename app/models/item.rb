class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :delivery
    belongs_to_active_hash :postage
    belongs_to_active_hash :prefecture
    has_one_attached :image
    belongs_to :user
    has_one :purchase

    with_options presence: true do
      validates :name
      validates :image
      validates :information
      validates :prefecture_id
      validates :category_id, numericality: { other_than: 1 }
      validates :condition_id, numericality: { other_than: 1 }
      validates :delivery_id, numericality: { other_than: 1 }
      validates :postage_id,numericality: { other_than: 1 }
      validates :price, numericality:{ greater_than_or_equal_to: 300, less_than: 9999999 }
    end
end