class Order < ApplicationRecord
  belongs_to :product
  belongs_to :trading

  validates :status, presence: true
end
