class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :author_id

      t.timestamps
    end
    add_index :categories, :author_id
    add_foreign_key :categories, :users, column: :author_id
  end
end
