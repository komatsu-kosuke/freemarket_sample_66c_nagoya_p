class Product < ApplicationRecord
  has_one :shipping
  accepts_nested_attributes_for :shipping, allow_destroy: true
  has_one :order
  has_many :likes
  has_many :comments
  has_many :products_images
  accepts_nested_attributes_for :products_images
  belongs_to :user ,optional: true
  belongs_to :brand ,optional: true
  belongs_to :size, optional: true
  belongs_to :category ,optional: true

  
  


  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :status
  end
end
