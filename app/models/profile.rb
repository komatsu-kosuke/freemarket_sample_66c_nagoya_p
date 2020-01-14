class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :firstname
    validates :familyname
    validates :firstname_kana
    validates :familyname_kana	
    validates :birthyear
    validates :birthmonth
    validates :birthday
    validates :phonenumber, uniqueness: true
    validates :user_description	
end
