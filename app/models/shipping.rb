class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :product, optional: true

  with_options presence: true do
    validates :period_before_shipping	
    validates :prefecture_from
    validates :fee_burden
  end
end
