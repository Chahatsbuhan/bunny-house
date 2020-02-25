class Bukken < ActiveRecord::Base
  belongs_to :user
  has_many :bukken_categories
  has_many :categories, through: :bukken_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 3000 }
  validates :user_id, presence: true
end
