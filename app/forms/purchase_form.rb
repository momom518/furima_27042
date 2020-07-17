class PurchaseForm
  include ActiveModel::Model

  attr_accessor :card_token,
                :postal_code,
                :prefecture_id,
                :city,
                :house_number,
                :building_name,
                :telephone_number,
                :user_id,
                :item_id,
                :customer_token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :customer_token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :telephone_number, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, telephone_number: telephone_number, purchase_id: purchase.id, user_id: user_id)
    card = Card.create(card_token: card_token, user_id: user_id, purchase_id: purchase.id, customer_token: customer_token)

    if purchase.persisted? && address.persisted? && card.persisted?
      true
    else
      false
    end
  end
end
