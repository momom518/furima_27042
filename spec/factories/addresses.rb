FactoryBot.define do
  factory :address do
    postal_code         { '123-4567' }
    prefecture_id       { '2' }
    city                { '白井市' }
    house_number        { '４丁目' }
    building_name       { '102号室' }
    telephone_number    { '09011112222' }
    user
    purchase
  end
end
