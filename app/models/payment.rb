class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments, foreign_key: 'payment_id', class_name: 'CategoryPayment', dependent: :delete_all
  
  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  
  
end
