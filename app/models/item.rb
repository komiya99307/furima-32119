class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image


  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :category_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :shipping_date_id, numericality: { other_than: 1 }
  end
  
  

end
