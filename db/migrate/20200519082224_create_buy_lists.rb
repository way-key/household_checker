class CreateBuyLists < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_lists do |t|

      t.string :title, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
