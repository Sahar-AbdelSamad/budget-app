class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', class_name: 'Category'
  has_many :payments, foreign_key: 'author_id', class_name: 'Payment'
  
  validates :fullname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
