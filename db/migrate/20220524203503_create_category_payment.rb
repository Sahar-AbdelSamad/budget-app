class CreateCategoryPayment < ActiveRecord::Migration[7.0]
  def change
    create_table :category_payments do |t|
      t.bigint :payment_id, null: false
      t.bigint :category_id, null: false

      t.timestamps
    end
    add_index :category_payments, :payment_id
    add_foreign_key :category_payments, :payments, column: :payment_id
    add_index :category_payments, :category_id
    add_foreign_key :category_payments, :categories, column: :category_id
  end
end
