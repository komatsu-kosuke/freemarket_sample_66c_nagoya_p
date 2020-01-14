class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :method, null: false
      t.string :shipping_price, null: false
      t.string :period_before_shipping, null: false
      t.string :prefecture_from, null: false
      t.string :fee_burden, null: false
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
