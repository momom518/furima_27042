require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with a name, image, information, category, condition, delivery, postage, prefecture, price' do
    item = build(:item)
    binding.pry
    expect(item).to be_valid
  end

  it 'is invalid without name' do
    item = build(:item, name: '')
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without image' do
    item = build(:item, image: nil)
    item.valid?
    expect(item.errors[:image]).to include("can't be blank")
  end

  it 'is invalid without information' do
    item = build(:item, information: '')
    item.valid?
    expect(item.errors[:information]).to include("can't be blank")
  end

  it 'is invalid without category' do
    item = build(:item, category_id: '')
    item.valid?
    expect(item.errors[:category_id]).to include("can't be blank")
  end

  it 'is invalid without condition_id' do
    item = build(:item, condition_id: '')
    item.valid?
    expect(item.errors[:condition_id]).to include("can't be blank")
  end

  it 'is invalid without delivery_id' do
    item = build(:item, delivery_id: '')
    item.valid?
    expect(item.errors[:delivery_id]).to include("can't be blank")
  end

  it 'is invalid without postage_id' do
    item = build(:item, postage_id: '')
    item.valid?
    expect(item.errors[:postage_id]).to include("can't be blank")
  end

  it 'is invalid without prefecture_id' do
    item = build(:item, prefecture_id: '')
    item.valid?
    expect(item.errors[:prefecture_id]).to include("can't be blank")
  end

  it 'is invalid without price' do
    item = build(:item, price: '')
    item.valid?
    expect(item.errors[:price]).to include("can't be blank")
  end

  it 'is invalid price that has more than 10000000' do
    item = build(:item, price: '10000000')
    item.valid?
    expect(item.errors[:price]).to include('must be less than 9999999')
  end

  it 'is invalid price that has less than 299' do
    item = build(:item, price: '299')
    item.valid?
    expect(item.errors[:price]).to include('must be greater than or equal to 300')
  end

  it 'is valid price that has more than ' do
    item = build(:item, price: '9999999')
    item.valid?
    expect(item.errors[:price]).to include('must be less than 9999999')
  end
end
