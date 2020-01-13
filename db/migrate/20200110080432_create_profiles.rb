class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname, null: false
      t.string :familyname, null: false
      t.string :firstname_kana, null: false
      t.string :familyname_kana, null: false
      t.integer :birthyear, null: false
      t.integer :birthmonth, null: false
      t.integer :birthday, null: false
      t.integer :phonenumber, null: false
      t.references :users, null: false, foreign_key: true
      t.timestamps
    end
  end
end
