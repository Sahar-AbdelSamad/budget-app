class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', class_name: 'Category'
  validates :fullname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
