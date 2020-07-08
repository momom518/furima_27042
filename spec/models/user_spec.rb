require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end
    it 'is valid with a nickname, firstname,lastname,firstname_kana,lastname_kana,email, password, password_confirmation' do
      expect(@user).to be_valid
    end

    it 'is invalid without a nickname' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without firstname' do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors[:firstname]).to include("can't be blank")
    end

    it 'is invalid without lastname' do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors[:lastname]).to include("can't be blank")
    end

    it 'is invalid without firstname_kana' do
      @user.firstname_kana = nil
      @user.valid?
      expect(@user.errors[:firstname_kana]).to include("can't be blank")
    end

    it 'is invalid without lastname_kana' do
      @user.lastname_kana = nil
      @user.valid?
      expect(@user.errors[:lastname_kana]).to include("can't be blank")
    end

    it 'is invalid without password' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid without password_confirmation' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'is invalid without birthday ' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it 'is invalid firstname hankaku ' do
      @user.firstname = 'taro'
      @user.valid?
      expect(@user.errors[:firstname]).to include('is invalid')
    end

    it 'is invalid lastname hankaku ' do
      @user.lastname = 'suzuki'
      @user.valid?
      expect(@user.errors[:lastname]).to include('is invalid')
    end

    it 'is invalid firstname_kana hankaku,zenkaku-kanji,zenkaku-hiragana ' do
      @user.firstname_kana = '太朗'
      @user.valid?
      expect(@user.errors[:firstname_kana]).to include('is invalid')
    end

    it 'is invalid lastname_kana hankaku,zenkaku-kanji,zenkaku-hiragana ' do
      @user.lastname_kana = '鈴木'
      @user.valid?
      expect(@user.errors[:lastname_kana]).to include('is invalid')
    end

    it 'is invalid without a password_confirmation although with a password' do
      @user.password = 'fff1122'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid with  that has less than 5 characters ' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'is valid with that has more than 6 characters ' do
      @user.password = '111aaa'
      expect(@user).to be_valid
    end

    it 'is invalid only number ' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'is invalid without @' do
      @user.email = 'aaaaaa.com'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = @user.dup
      @user.save
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end
  end
end
