## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_one :profile
- has_one :creditcard
- has_many :products
- has_many :likes
- has_many :tradings
- has_many :comments
- has_many :address



## profileテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|familyname|string|null: false|
|firstname_kana|string|null: false|
|familyname_kana|string|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|phonenumber|integer|null: false|
|user_description|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|district|string|null: false|
|building|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user





## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|price|string|null: false|
|status|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
### Association
- has_one :shipping
- has_one :order
- has_many :likes
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :category



## shippingテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|shipping_price|string|null: false|
|period_before_shipping|string|null: false|
|prefecture_from|string|null: false|
|fee_burden|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product



## creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|cardnumber|integer|null: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## products_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product



## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: true|
### Association
- has_many :products



## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: true|
### Association
- has_many :products



## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: true|
### Association
- has_many :products



## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: true|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product



## orderテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|product_id|integer|null: false, foreign_key: true|
|trading_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :trading



## tradingテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :orders
- has_many :reviews
- belongs_to :user



## reviewテーブル
|Column|Type|Options|
|------|----|-------|
|review|string|null: false|
|trading_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :trading