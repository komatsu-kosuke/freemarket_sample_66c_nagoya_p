class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.integer :cardnumber, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
