class AddProgressToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :progress, :integer,null: false, default: 1 
  end
end
