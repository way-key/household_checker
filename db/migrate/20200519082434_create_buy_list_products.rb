class CreateBuyListProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_list_products do |t|

      t.integer :buy_list_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false
      t.date :last_buy
      t.integer :last_amount
      t.integer :cost
      t.integer :dead_line, null: false
      t.timestamps
    end
  end
end
