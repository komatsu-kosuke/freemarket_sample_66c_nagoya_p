class Shipping < ApplicationRecord
  belongs_to :product

  with_options presence: true do
    # validates :method
    # validates :shipping_price
    validates :period_before_shipping	
    validates :prefecture_from
    validates :fee_burden
  end
end
