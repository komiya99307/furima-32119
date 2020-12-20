class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_date

  validates :name,  presence: true
  validates :text,  presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  

end
