require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = build(:item)
  end

  it 'is valid with a name, image, information, category, condition, delivery, postage, prefecture, price' do
    expect(@item).to be_valid
  end

  it 'is invalid without name' do
    @item.name = nil
    @item.valid?
    expect(@item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without image' do
    @item.image = nil
    @item.valid?

    expect(@item.errors[:image]).to include("can't be blank")
  end

  it 'is invalid without information' do
    @item.information = nil
    @item.valid?
    expect(@item.errors[:information]).to include("can't be blank")
  end

  it 'is invalid without category' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors[:category_id]).to include("can't be blank")
  end

  it 'is invalid without condition_id' do
    @item.condition_id = nil
    @item.valid?
    expect(@item.errors[:condition_id]).to include("can't be blank")
  end

  it 'is invalid without delivery_id' do
    @item.delivery_id = nil
    @item.valid?
    expect(@item.errors[:delivery_id]).to include("can't be blank")
  end

  it 'is invalid without postage_id' do
    @item.postage_id = nil
    @item.valid?
    expect(@item.errors[:postage_id]).to include("can't be blank")
  end

  it 'is invalid without prefecture_id' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors[:prefecture_id]).to include("can't be blank")
  end

  it 'is invalid without price' do
    @item.price = nil
    @item.valid?
    expect(@item.errors[:price]).to include("can't be blank")
  end

  it 'is invalid price that has more than 10000000' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors[:price]).to include('must be less than 10000000')
  end

  it 'is invalid price that has less than 299' do
    @item.price = 299
    @item.valid?
    expect(@item.errors[:price]).to include('must be greater than or equal to 300')
  end

  it 'is valid price that has less than 9999999 ' do
    @item.price = 9_999_999
    @item.valid?
    expect(@item).to be_valid
  end

  it 'is valid price that has more than 300 ' do
    @item.price = 300
    @item.valid?
    expect(@item).to be_valid
  end
end
