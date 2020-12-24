FactoryBot.define do
  factory :purchase do
    postal_code            { '123-4567' }
    area_id                { 1 }
    city_town              { 'aaaaaaa' }
    house_number           { 'aaaaaaa' }
    bilding_number         { 'aaaaaaa' }
    phone_number           { '11111111111'}

    association :user_id, factory: :user
    association :item_id, factory: :item
    
  end
end
