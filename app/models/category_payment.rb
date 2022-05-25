class CategoryPayment < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :payment, class_name: 'Payment'

  after_create :increment_category_total

  private

  def increment_category_total
    category.increment!(:total, payment.amount)
  end
end
