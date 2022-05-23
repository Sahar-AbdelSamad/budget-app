class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :name, presence: true
  validates :icon, presence: true
end
