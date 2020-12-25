class Purchase 

  include ActiveModel::Model

  attr_accessor :postal_code, :area_id, :city_town, :house_number, :bilding_number, :phone_number, :item_id, :user_id, :token
    
  with_options presence: true do
      validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
      validates :area_id, numericality: { other_than: 0 }
      validates :city_town
      validates :house_number
      validates :phone_number, format: { with: /\A\d{10,11}\z/ }
      validates :token
      validates :user_id
      validates :item_id
   end

   def save
    history = History.create( user_id: user_id, item_id: item_id)

    Address.create( postal_code: postal_code, area_id: area_id, city_town: city_town, house_number: house_number, bilding_number: bilding_number, phone_number: phone_number, history_id: history.id)

   end
end
   
