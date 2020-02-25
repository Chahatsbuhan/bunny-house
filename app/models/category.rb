class Category < ApplicationRecord
  has_many :bukken_categories
  has_many :bukkens, through: :bukken_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
