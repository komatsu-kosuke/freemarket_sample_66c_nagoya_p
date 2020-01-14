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

  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
    validates :address
  end
end
