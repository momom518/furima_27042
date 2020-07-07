require 'rails_helper'

describe User do
  describe '#create' do
    it 'is valid with a nickname, firstname,lastname,firstname_kana,lastname_kana,email, password, password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a nickname' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without firstname' do
      user = build(:user, firstname: '')
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it 'is invalid without lastname' do
      user = build(:user, lastname: '')
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it 'is invalid without firstname_kana' do
      user = build(:user, firstname_kana: '')
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it 'is invalid without lastname_kana' do
      user = build(:user, lastname_kana: '')
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it 'is invalid without password' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid without password_confirmation' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'is invalid without birthday ' do
      user = build(:user, birthday: '')
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it 'is invalid firstname hankaku ' do
      user = build(:user, firstname: 'name1')
      user.valid?
      expect(user.errors[:firstname]).to include('is invalid')
    end

    it 'is invalid lastname hankaku ' do
      user = build(:user, lastname: 'name1')
      user.valid?
      expect(user.errors[:lastname]).to include('is invalid')
    end

    it 'is invalid firstname_kana hankaku,zenkaku-kanji,zenkaku-hiragana ' do
      user = build(:user, firstname_kana: 'name1')
      user.valid?
      expect(user.errors[:firstname_kana]).to include('is invalid')
    end

    it 'is invalid lastname_kana hankaku,zenkaku-kanji,zenkaku-hiragana ' do
      user = build(:user, lastname_kana: 'name')
      user.valid?
      expect(user.errors[:lastname_kana]).to include('is invalid')
    end

    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: 'fff1122')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid with  that has less than 5 characters ' do
      user = build(:user, password: '111aa')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end

    it 'is valid with that has more than 6 characters ' do
      user = build(:user, password: '111aaa')
      expect(user).to be_valid
    end

    it 'is invalid with that has less than 5 characters ' do
      user = build(:user, password_confirmation: '111aa')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('is invalid')
    end

    it 'is valid with that has more than 6 characters ' do
      user = build(:user, password_confirmation: '111aaa')
      expect(user).to be_valid
    end
    it 'is invalid both number and alphabet ' do
      user = build(:user, password: '111111')
      user.valid?
      expect(user.errors[:password]).to include('is invalid')
    end

    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid without @' do
      user = build(:user, email: 'aaaaaaaaaa')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end
  end
end
