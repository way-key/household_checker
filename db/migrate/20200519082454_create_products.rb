class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.integer :genre_id
      t.string :name, null: false
      t.string :image_id
      t.text :introduction
      t.integer :jan_code
      t.boolean :status, null: false, default: true
      t.timestamps
    end
  end
end
