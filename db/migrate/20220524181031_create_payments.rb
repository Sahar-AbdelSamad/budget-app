class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.bigint :author_id, null: false

      t.timestamps
    end
    add_index :payments, :author_id
    add_foreign_key :payments, :users, column: :author_id
  end
end
