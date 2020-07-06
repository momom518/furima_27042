class Address < ApplicationRecord
  belongs_to :user
  belonds_to_active_hash :prefecture_id
end
