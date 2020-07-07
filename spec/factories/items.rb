FactoryBot.define do
  factory :item do
    name              {' ノート '}
    image             { Rack::Test::UploadedFile.new('spec/fixtures/00013646_72B.jpg') }
    information       {' A4サイズ '}
    prefecture_id     {' 2 '}
    category_id       {' 2 '}
    condition_id      {' 2 '}
    delivery_id       {' 2 '}
    postage_id        {' 2 '}
    price             {' 3000 '}
    user
  end
end
