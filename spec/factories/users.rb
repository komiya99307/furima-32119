FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end
