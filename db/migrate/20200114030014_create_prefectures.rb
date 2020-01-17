class CreatePrefectures < ActiveRecord::Migration[5.2]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  def change
    create_table :prefectures do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
