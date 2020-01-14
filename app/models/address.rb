class Address < ApplicationRecord
  belongs_to :user, optional: true


  with_options presence: true do
    validates :zipcode
    validates :prefecture
    validates :city
    validates :district
    validates :building
  end
end
