class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :method
      t.string :shipping_price
      t.string :period_before_shipping, null: false
      t.string :prefecture_from
      t.string :fee_burden, null: false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
