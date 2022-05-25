class CategoryPayment < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :payment, class_name: 'Payment'

  private
  def total
    total = 0
    total = total+payment.amout
    total
  end
end
