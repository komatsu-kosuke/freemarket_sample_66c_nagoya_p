class Review < ApplicationRecord
  belongs_to :trading

  validates :title, presence: true
end
