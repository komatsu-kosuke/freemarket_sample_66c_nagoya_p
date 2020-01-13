class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :review, null: true
      t.references :trading, null: false, foreign_key: true
      t.timestamps
    end
  end
end
