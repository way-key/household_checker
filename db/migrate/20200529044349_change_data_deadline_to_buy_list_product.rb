class ChangeDataDeadlineToBuyListProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :buy_list_products, :dead_line, :integer
    add_column :buy_list_products, :dead_line, :date
  end
end
