class Product < ApplicationRecord
  has_one :shipping
  has_one :order
  has_many :likes
  has_many :comments
  has_many :images
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
end
