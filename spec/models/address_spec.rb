require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @address = build(:address)
    @user = create(:user)
  end

  it 'is valid with prefecture_id, city, house_number, building_name, telephone_number ' do
    expect(@address).to be_valid
  end

  it 'is invalid without postal_code' do
    @address.postal_code = nil
    @address.valid?
    expect(@address.errors[:postal_code]).to include("can't be blank")
  end

  it 'is invalid without hyphen' do
    @address.postal_code = '12345678'
    @address.valid?
    expect(@address.errors[:postal_code]).to include('is invalid')
  end

  it 'is invalid without over 7 charactors' do
    @address.postal_code = '123-45678'
    @address.valid?
    expect(@address.errors[:postal_code]).to include('is invalid')
  end

  it 'is invalid without prefecture_id' do
    @address.prefecture_id = nil
    @address.valid?
    expect(@address.errors[:prefecture_id]).to include("can't be blank")
  end

  it 'is invalid without city' do
    @address.city = nil
    @address.valid?
    expect(@address.errors[:city]).to include("can't be blank")
  end

  it 'is invalid without house_number' do
    @address.house_number = nil
    @address.valid?
    expect(@address.errors[:house_number]).to include("can't be blank")
  end

  it 'is also valid without building_name' do
    @address.building_name = nil
    expect(@address).to be_valid
  end

  it 'is invalid without telephone_number' do
    @address.telephone_number = nil
    @address.valid?
    expect(@address.errors[:telephone_number]).to include("can't be blank")
  end

  it 'is invalid over than 11 characters' do
    @address.telephone_number = '090111122223'
    @address.valid?
    expect(@address.errors[:telephone_number]).to include('is too long (maximum is 11 characters)')
  end

  it 'is valid 11 characters' do
    @address.telephone_number = '09011112222'
    expect(@address).to be_valid
  end

  it 'is valid less than 11 characters' do
    @address.telephone_number = '0901111222'
    expect(@address).to be_valid
  end
end
