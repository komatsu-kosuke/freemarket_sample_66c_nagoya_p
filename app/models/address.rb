class Address < ApplicationRecord
  belongs_to :user, optional: true

  VALID_ZIPCODE = /\A\d{3}-\d{4}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  

  validates :zipcode, presence: true, length: { maximum: 8 }
  validates :prefecture, presence: { message: 'を選択してください'}
  validates :city, presence: true, length: { maximum: 50 }
  validates :district, presence: true, length: { maximum: 100 }
  validates :building, presence: true, length: { maximum: 50 }

  # with_options presence: true do
  #   validates :zipcode
  #   validates :prefecture
  #   validates :city
  #   validates :district
  #   validates :building
  # end
end

