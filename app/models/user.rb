class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_one :creditcard
  has_many :products
  has_many :likes
  has_many :tradings
  has_many :comments
  has_many :address
  has_many :cards

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :address
    validates :firstname
    validates :familyname
    validates :firstname_kana
    validates :familyname_kana	
    validates :birthyear
    validates :birthmonth
    validates :birthday
    validates :phonenumber, uniqueness: true
  end
  
end
