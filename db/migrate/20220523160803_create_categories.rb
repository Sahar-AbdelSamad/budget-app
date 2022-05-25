class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.bigint :author_id, null: false

      t.timestamps
    end
    add_index :categories, :author_id
    add_foreign_key :categories, :users, column: :author_id
  end
end
