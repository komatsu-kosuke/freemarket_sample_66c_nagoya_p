class Shipping < ApplicationRecord
  belongs_to :product

  with_options presence: true do
    validates :period_before_shipping	
    validates :prefecture_from
    validates :fee_burden
  end
end
