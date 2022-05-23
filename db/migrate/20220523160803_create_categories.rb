class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :user_id

      t.timestamps
    end
    add_index :categories, :user_id
    add_foreign_key :categories, :users, column: :user_id
  end
end
