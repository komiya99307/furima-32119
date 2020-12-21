FactoryBot.define do
  factory :item do
    name              { '景色' }
    text              { 'とても良い景色'}
    category_id       { 2 }
    state_id          { 2 }
    burden_id         { 2 }
    area_id           { 2 }
    shipping_date_id  { 2 }
    price             { 10000 }
    association :user  
  end
end
