class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments, foreign_key: 'category_id', class_name: 'CategoryPayment', dependent: :delete_all
  
  validates :name, presence: true
  validates :icon, presence: true
  
end
