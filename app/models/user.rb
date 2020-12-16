class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A\p{katakana}+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
