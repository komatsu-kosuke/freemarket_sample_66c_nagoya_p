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
  has_one :address
  has_many :cards
  
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  validates :nickname, presence: true, length: { maximum: 20, message: 'を20文字以内にしてください' }, profanity_filter: true
  validates :email, presence: true, uniqueness: { message: 'はすでに使用されています'}
  # validates :password, presence: true, length: { in: 7..128, message: 'を7桁以上にしてください' }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :encrypted_password, presence: true, length: { in: 7..128, message: 'を7桁以上にしてください' }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :familyname, presence: true, length: { maximum: 35, message: 'を35文字以内にしてください' }, profanity_filter: true
  validates :firstname, presence: true, length: { maximum: 35, message: 'を35文字以内にしてください' }, profanity_filter: true
  validates :familyname_kana, presence: true, length: { maximum: 35, message: 'を35文字以内にしてください' }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}, profanity_filter: true
  validates :firstname_kana, presence: true, length: { maximum: 35, message: 'を35文字以内にしてください' }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}, profanity_filter: true
  validates :birthyear, presence: true
  validates :birthmonth, presence: true
  validates :birthday, presence: true

  validates :phonenumber, presence: true, format: { with: /\A\d{10,11}\z/, message: 'の入力が正しくありません'}
  
end
