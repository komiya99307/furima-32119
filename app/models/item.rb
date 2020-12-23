class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :history
  has_one_attached :image


  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/ }
  end
   
  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :shipping_date_id
  end
  
  

end
