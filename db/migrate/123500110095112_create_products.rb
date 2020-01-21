class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :price, null: false
      t.string :status, null: false
      t.references :users, foreign_key: true
      t.references :shipping, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end