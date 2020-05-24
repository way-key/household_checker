class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.float :score, null: false
      t.text :comment
      t.boolean :status, default: true, null: false
      t.timestamps
    end
  end
end
