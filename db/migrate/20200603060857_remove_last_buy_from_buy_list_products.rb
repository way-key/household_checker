class RemoveLastBuyFromBuyListProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :buy_list_products, :last_buy, :integer
  end
end
