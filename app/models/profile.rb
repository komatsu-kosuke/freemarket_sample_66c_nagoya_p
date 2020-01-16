class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :user_description	
  end
end
