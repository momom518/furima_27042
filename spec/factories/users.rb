FactoryBot.define do
  factory :user do
    nickname              { '田なか２' }
    firstname             { '田中' }
    lastname              { 'その子' }
    firstname_kana        { 'タナカ' }
    lastname_kana         { 'ソノコ' }
    email                 { 'yyy@sample.com' }
    password              { '111aaa' }
    password_confirmation { '111aaa' }
    birthday              { '1990-1-1' }
  end
end
