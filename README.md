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



## profilesテーブル
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


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|district|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user





## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
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



## shippingsテーブル
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



## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|cardnumber|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :products



## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string||
### Association
- has_many :products



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string||
### Association
- has_many :products



## likesテーブル
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
|text|string||
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product



## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|product_id|integer|null: false, foreign_key: true|
|trading_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :trading



## tradingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :orders
- has_many :reviews
- belongs_to :user



## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|review|string|null: false|
|trading_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :trading